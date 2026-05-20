function nextStep(id) {
  document
    .querySelectorAll("section")
    .forEach((s) => s.classList.remove("active"));
  document.getElementById(id).classList.add("active");

  if (id === "admin") {
    initAdmin();
  }
}

function acceptAnyPassword() {
  const pw = document.getElementById("pw").value;
  const pw2 = document.getElementById("pw2").value;
  const error = document.getElementById("pwError");

  if (pw !== pw2) {
    error.textContent = "Passwords do not match.";
    return;
  }

  error.textContent = "";
  nextStep("terms");
}

function checkTerms() {
  if (document.getElementById("accept").checked) {
    nextStep("inbox");
  } else {
    alert("You must accept the terms to proceed.");
  }
}

let map;

function initAdmin() {
  // 1. Setup Chart
  const ctx = document.getElementById("rentalChart").getContext("2d");
  new Chart(ctx, {
    type: "bar",
    data: {
      labels: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
      datasets: [
        {
          label: "Vehicle Rentals",
          data: [12, 19, 3, 5, 2, 3, 7],
          backgroundColor: "#90EE90",
        },
      ],
    },
  });

  map = L.map("map").setView([27.7172, 85.324], 12);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "© OpenStreetMap contributors",
  }).addTo(map);

  L.marker([27.7172, 85.324])
    .addTo(map)
    .bindPopup("<b>RIDEX Main Hub</b><br>Kathmandu, Nepal")
    .openPopup();
}

function showAdmin(section) {
  document.getElementById("adminHome").style.display = "none";
  document.getElementById("adminDashboard").style.display = "none";
  document.getElementById("adminSettings").style.display = "none";

  if (section === "home") {
    document.getElementById("adminHome").style.display = "block";
  }

  if (section === "dashboard") {
    document.getElementById("adminDashboard").style.display = "block";

    setTimeout(() => {
      if (map) {
        map.invalidateSize();
      }
    }, 100);
  }

  if (section === "settings") {
    document.getElementById("adminSettings").style.display = "block";
  }
}
