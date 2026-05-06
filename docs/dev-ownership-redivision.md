# Code Ownership Re-Division

- Scope: files with actual code/content only (comment-only stubs excluded).
- Excluded by request: migrations folder.
- Additional exclusions: .venv, vendor, and generated/log/cache/upload/image folders.
- File entry format: relative path | Location: absolute path.

- Total code files mapped: 70
- Frontend Dev: 29
- Core Backend Dev: 23
- JSON Sync + DB Infra Dev: 18

## Frontend Dev suhana

- public/css/admin.css | Location: C:\xampp\htdocs\rentals-app\public\css\admin.css
- public/css/booking.css | Location: C:\xampp\htdocs\rentals-app\public\css\booking.css
- public/css/styles.css | Location: C:\xampp\htdocs\rentals-app\public\css\styles.css
- public/css/user.css | Location: C:\xampp\htdocs\rentals-app\public\css\user.css
- public/js/admin-booking-modals.js | Location: C:\xampp\htdocs\rentals-app\public\js\admin-booking-modals.js
- public/js/admin-bookings-search.js | Location: C:\xampp\htdocs\rentals-app\public\js\admin-bookings-search.js
- public/js/app.js | Location: C:\xampp\htdocs\rentals-app\public\js\app.js
- public/js/booking.js | Location: C:\xampp\htdocs\rentals-app\public\js\booking.js
- public/js/user-register-modals.js | Location: C:\xampp\htdocs\rentals-app\public\js\user-register-modals.js
- src/Templates/layout.php | Location: C:\xampp\htdocs\rentals-app\src\Templates\layout.php
- src/Views/admin/bookings/list.php | Location: C:\xampp\htdocs\rentals-app\src\Views\admin\bookings\list.php
- src/Views/admin/vehicles/list.php | Location: C:\xampp\htdocs\rentals-app\src\Views\admin\vehicles\list.php
- src/Views/booking/detail.php | Location: C:\xampp\htdocs\rentals-app\src\Views\booking\detail.php
- src/Views/booking/form.php | Location: C:\xampp\htdocs\rentals-app\src\Views\booking\form.php
- src/Views/booking/history.php | Location: C:\xampp\htdocs\rentals-app\src\Views\booking\history.php
- src/Views/booking/receipt.php | Location: C:\xampp\htdocs\rentals-app\src\Views\booking\receipt.php
- src/Views/booking/select.php | Location: C:\xampp\htdocs\rentals-app\src\Views\booking\select.php
- src/Views/home/index.php | Location: C:\xampp\htdocs\rentals-app\src\Views\home\index.php
- src/Views/home/vehicle-card.php | Location: C:\xampp\htdocs\rentals-app\src\Views\home\vehicle-card.php
- src/Views/partials/footer.php | Location: C:\xampp\htdocs\rentals-app\src\Views\partials\footer.php
- src/Views/partials/header.php | Location: C:\xampp\htdocs\rentals-app\src\Views\partials\header.php
- src/Views/partials/modals.php | Location: C:\xampp\htdocs\rentals-app\src\Views\partials\modals.php
- src/Views/policy/damage-management-policy.php | Location: C:\xampp\htdocs\rentals-app\src\Views\policy\damage-management-policy.php
- src/Views/policy/deposit-policy.php | Location: C:\xampp\htdocs\rentals-app\src\Views\policy\deposit-policy.php
- src/Views/policy/privacy-policy.php | Location: C:\xampp\htdocs\rentals-app\src\Views\policy\privacy-policy.php
- src/Views/policy/terms-conditions.php | Location: C:\xampp\htdocs\rentals-app\src\Views\policy\terms-conditions.php
- src/Views/user/register.php | Location: C:\xampp\htdocs\rentals-app\src\Views\user\register.php
- src/Views/vehicle/detail.php | Location: C:\xampp\htdocs\rentals-app\src\Views\vehicle\detail.php
- src/Views/vehicle/list.php | Location: C:\xampp\htdocs\rentals-app\src\Views\vehicle\list.php

## Core Backend Dev rashik

- bin/migrate.php | Location: C:\xampp\htdocs\rentals-app\bin\migrate.php
- bin/seed.php | Location: C:\xampp\htdocs\rentals-app\bin\seed.php
- bin/sync_vehicles_json.php | Location: C:\xampp\htdocs\rentals-app\bin\sync_vehicles_json.php
- config/config.php | Location: C:\xampp\htdocs\rentals-app\config\config.php
- config/database.php | Location: C:\xampp\htdocs\rentals-app\config\database.php
- data/vehicles-json/bikes.json | Location: C:\xampp\htdocs\rentals-app\data\vehicles-json\bikes.json
- data/vehicles-json/cars.json | Location: C:\xampp\htdocs\rentals-app\data\vehicles-json\cars.json
- data/vehicles-json/luxury.json | Location: C:\xampp\htdocs\rentals-app\data\vehicles-json\luxury.json
- public/ajax/admin-bookings-search.php | Location: C:\xampp\htdocs\rentals-app\public\ajax\admin-bookings-search.php
- public/index.php | Location: C:\xampp\htdocs\rentals-app\public\index.php
- src/Helpers/auth.php | Location: C:\xampp\htdocs\rentals-app\src\Helpers\auth.php
- src/Helpers/booking_flow.php | Location: C:\xampp\htdocs\rentals-app\src\Helpers\booking_flow.php
- src/Helpers/logs.php | Location: C:\xampp\htdocs\rentals-app\src\Helpers\logs.php
- src/Helpers/url.php | Location: C:\xampp\htdocs\rentals-app\src\Helpers\url.php
- src/Helpers/validation.php | Location: C:\xampp\htdocs\rentals-app\src\Helpers\validation.php
- src/Helpers/vehicle_json_sync.php | Location: C:\xampp\htdocs\rentals-app\src\Helpers\vehicle_json_sync.php
- src/Models/BaseModel.php | Location: C:\xampp\htdocs\rentals-app\src\Models\BaseModel.php
- src/Models/Booking.php | Location: C:\xampp\htdocs\rentals-app\src\Models\Booking.php
- src/Models/Category.php | Location: C:\xampp\htdocs\rentals-app\src\Models\Category.php
- src/Models/Payment.php | Location: C:\xampp\htdocs\rentals-app\src\Models\Payment.php
- src/Models/Session.php | Location: C:\xampp\htdocs\rentals-app\src\Models\Session.php
- src/Models/User.php | Location: C:\xampp\htdocs\rentals-app\src\Models\User.php
- src/Models/Vehicle.php | Location: C:\xampp\htdocs\rentals-app\src\Models\Vehicle.php

## JSON Sync + DB Infra Dev diya

- bin/cron_bootstrap.php | Location: C:\xampp\htdocs\rentals-app\bin\cron_bootstrap.php
- bin/cron_cleanup_gps.php | Location: C:\xampp\htdocs\rentals-app\bin\cron_cleanup_gps.php
- bin/cron_expire_bookings.php | Location: C:\xampp\htdocs\rentals-app\bin\cron_expire_bookings.php
- bin/cron_generate_stats.php | Location: C:\xampp\htdocs\rentals-app\bin\cron_generate_stats.php
- bin/cron_send_reminders.php | Location: C:\xampp\htdocs\rentals-app\bin\cron_send_reminders.php
- bin/cron_verify_payments.php | Location: C:\xampp\htdocs\rentals-app\bin\cron_verify_payments.php
- charts/fleet_chart.js | Location: C:\xampp\htdocs\rentals-app\charts\fleet_chart.js
- charts/vehicles_chart.js | Location: C:\xampp\htdocs\rentals-app\charts\vehicles_chart.js
- composer.json | Location: C:\xampp\htdocs\rentals-app\composer.json
- data/vehicles-json/.vehicles-sync-state.json | Location: C:\xampp\htdocs\rentals-app\data\vehicles-json\.vehicles-sync-state.json
- public/js/admin-dashboard.js | Location: C:\xampp\htdocs\rentals-app\public\js\admin-dashboard.js
- public/js/admin-live-tracking-map.js | Location: C:\xampp\htdocs\rentals-app\public\js\admin-live-tracking-map.js
- src/Helpers/runtime_sync.php | Location: C:\xampp\htdocs\rentals-app\src\Helpers\runtime_sync.php
- src/Views/admin/dashboard.php | Location: C:\xampp\htdocs\rentals-app\src\Views\admin\dashboard.php
- src/Views/admin/gps/live.php | Location: C:\xampp\htdocs\rentals-app\src\Views\admin\gps\live.php
- var/tmp_schema_columns.php | Location: C:\xampp\htdocs\rentals-app\var\tmp_schema_columns.php
- var/tmp_schema_indexes.php | Location: C:\xampp\htdocs\rentals-app\var\tmp_schema_indexes.php
- var/tmp_schema_tables.php | Location: C:\xampp\htdocs\rentals-app\var\tmp_schema_tables.php

