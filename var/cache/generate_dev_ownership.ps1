$ErrorActionPreference = 'Stop'
$root = (Get-Location).Path
$excludeFragments = @(
  '/.git/',
  '/.venv/',
  '/vendor/',
  '/migrations/',
  '/logs/',
  '/var/cache/',
  '/var/logs/',
  '/var/sessions/',
  '/public/uploads/',
  '/public/images/'
)

function Is-ExcludedPath([string]$fullPath) {
  $normalizedPath = $fullPath.Replace('\', '/').ToLowerInvariant()
  foreach ($fragment in $excludeFragments) {
    if ($normalizedPath.Contains($fragment)) { return $true }
  }
  return $false
}

function Strip-CommentLikeContent([string]$content, [string]$ext, [string]$name) {
  $text = $content

  if ($name -eq 'Dockerfile') {
    $text = [regex]::Replace($text, '(?m)^\s*#.*$', '')
    return $text
  }

  switch ($ext.ToLowerInvariant()) {
    '.php' {
      $text = $text -replace '^\uFEFF', ''
      $text = [regex]::Replace($text, '<\?php', '', 'IgnoreCase')
      $text = [regex]::Replace($text, '<\?(?!php)', '', 'IgnoreCase')
      $text = [regex]::Replace($text, '\?>', '')
      $text = [regex]::Replace($text, '(?s)/\*.*?\*/', '')
      $text = [regex]::Replace($text, '(?m)^\s*//.*$', '')
      $text = [regex]::Replace($text, '(?m)^\s*#.*$', '')
      return $text
    }
    '.js' {
      $text = [regex]::Replace($text, '(?s)/\*.*?\*/', '')
      $text = [regex]::Replace($text, '(?m)^\s*//.*$', '')
      return $text
    }
    '.css' {
      $text = [regex]::Replace($text, '(?s)/\*.*?\*/', '')
      return $text
    }
    '.sql' {
      $text = [regex]::Replace($text, '(?s)/\*.*?\*/', '')
      $text = [regex]::Replace($text, '(?m)^\s*--.*$', '')
      $text = [regex]::Replace($text, '(?m)^\s*#.*$', '')
      return $text
    }
    '.sh' {
      $text = [regex]::Replace($text, '(?m)^\s*#!.*$', '')
      $text = [regex]::Replace($text, '(?m)^\s*#.*$', '')
      return $text
    }
    default {
      return $text
    }
  }
}

function Get-Owner([string]$relPath) {
  $p = $relPath.Replace('\\','/')

  # Explicit reassignment requested: move only these files to backend ownership.
  if (
    $p -eq 'bin/migrate.php' -or
    $p -eq 'bin/seed.php' -or
    $p -eq 'bin/sync_vehicles_json.php' -or
    $p -eq 'config/config.php' -or
    $p -eq 'config/database.php' -or
    $p -eq 'data/vehicles-json/bikes.json' -or
    $p -eq 'data/vehicles-json/cars.json' -or
    $p -eq 'data/vehicles-json/luxury.json' -or
    $p -eq 'src/Helpers/vehicle_json_sync.php'
  ) { return 'Core Backend Dev' }

  # Reassign selected advanced frontend files that are tightly coupled with runtime infra domains.
  if (
    $p -eq 'charts/fleet_chart.js' -or
    $p -eq 'charts/vehicles_chart.js' -or
    $p -eq 'public/js/admin-dashboard.js' -or
    $p -eq 'public/js/admin-live-tracking-map.js' -or
    $p -eq 'src/Views/admin/dashboard.php' -or
    $p -eq 'src/Views/admin/gps/live.php'
  ) { return 'JSON Sync + DB Infra Dev' }

  if (
    $p.StartsWith('public/css/') -or
    $p.StartsWith('public/js/') -or
    $p.StartsWith('charts/') -or
    $p.StartsWith('src/Views/') -or
    $p.StartsWith('src/Templates/')
  ) { return 'Frontend Dev' }

  if (
    $p -eq 'Dockerfile' -or
    $p -eq 'composer.json' -or
    $p.StartsWith('docker/') -or
    $p.StartsWith('bin/') -or
    $p.StartsWith('data/deploy/') -or
    $p.StartsWith('data/vehicles-json/') -or
    $p -eq 'config/database.php' -or
    $p -eq 'config/env.example' -or
    $p -eq 'src/Helpers/runtime_sync.php' -or
    $p -eq 'src/Helpers/vehicle_json_sync.php' -or
    $p.StartsWith('var/tmp_schema_')
  ) { return 'JSON Sync + DB Infra Dev' }

  return 'Core Backend Dev'
}

$allowedExt = @('.php','.js','.css','.sql','.sh','.json','.yml','.yaml','.xml','.ini','.md')
$alwaysIncludeNames = @('Dockerfile','composer.json')

$files = Get-ChildItem -Path $root -Recurse -File | Where-Object {
  -not (Is-ExcludedPath $_.FullName)
} | Where-Object {
  $ext = $_.Extension.ToLowerInvariant()
  ($allowedExt -contains $ext) -or ($alwaysIncludeNames -contains $_.Name)
}

$items = @()
foreach ($file in $files) {
  $rel = Resolve-Path -Relative $file.FullName
  $rel = $rel.TrimStart('.')
  $rel = $rel.TrimStart('\\')
  $rel = $rel.TrimStart('/')
  $rel = $rel -replace '\\','/'
  $full = $file.FullName

  if ($rel.StartsWith('migrations/')) { continue }

  $raw = Get-Content -Path $file.FullName -Raw -ErrorAction SilentlyContinue
  if ($null -eq $raw) { continue }

  $stripped = Strip-CommentLikeContent -content $raw -ext $file.Extension -name $file.Name
  if ([string]::IsNullOrWhiteSpace($stripped)) { continue }

  if ($file.Extension.ToLowerInvariant() -eq '.md') { continue }

  $items += [pscustomobject]@{
    Path = $rel
    FullPath = $full
    Owner = Get-Owner -relPath $rel
  }
}

$items = $items | Sort-Object Path -Unique

$byOwner = @{
  'Frontend Dev' = @()
  'Core Backend Dev' = @()
  'JSON Sync + DB Infra Dev' = @()
}

foreach ($item in $items) {
  $byOwner[$item.Owner] += $item
}

$outPath = Join-Path $root 'docs/dev-ownership-redivision.md'
$null = New-Item -ItemType Directory -Path (Split-Path $outPath) -Force

$lines = @()
$lines += '# Code Ownership Re-Division'
$lines += ''
$lines += '- Scope: files with actual code/content only (comment-only stubs excluded).'
$lines += '- Excluded by request: migrations folder.'
$lines += '- Additional exclusions: .venv, vendor, and generated/log/cache/upload/image folders.'
$lines += '- File entry format: relative path | Location: absolute path.'
$lines += ''
$lines += ('- Total code files mapped: ' + $items.Count)
$lines += ('- Frontend Dev: ' + $byOwner['Frontend Dev'].Count)
$lines += ('- Core Backend Dev: ' + $byOwner['Core Backend Dev'].Count)
$lines += ('- JSON Sync + DB Infra Dev: ' + $byOwner['JSON Sync + DB Infra Dev'].Count)
$lines += ''

foreach ($owner in @('Frontend Dev','Core Backend Dev','JSON Sync + DB Infra Dev')) {
  $lines += ('## ' + $owner)
  $lines += ''
  foreach ($entry in ($byOwner[$owner] | Sort-Object Path)) {
    $lines += ('- ' + $entry.Path + ' | Location: ' + $entry.FullPath)
  }
  $lines += ''
}

Set-Content -Path $outPath -Value $lines -Encoding ASCII
Write-Output "Generated: docs/dev-ownership-redivision.md"
Write-Output ("Total files mapped: " + $items.Count)
Write-Output ("Frontend: " + $byOwner['Frontend Dev'].Count + ", Core Backend: " + $byOwner['Core Backend Dev'].Count + ", Infra: " + $byOwner['JSON Sync + DB Infra Dev'].Count)
