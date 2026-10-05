/* Plymouth State Panthers Football — fan hub interactions */
(function () {
  "use strict";

  /* Mobile navigation */
  var toggle = document.querySelector(".nav-toggle");
  var nav = document.getElementById("primary-nav");

  if (toggle && nav) {
    toggle.addEventListener("click", function () {
      var open = nav.classList.toggle("is-open");
      toggle.setAttribute("aria-expanded", String(open));
    });

    // Close the menu when a link is tapped
    nav.addEventListener("click", function (e) {
      if (e.target.tagName === "A") {
        nav.classList.remove("is-open");
        toggle.setAttribute("aria-expanded", "false");
      }
    });
  }

  /* Footer year */
  var year = document.querySelector("[data-year]");
  if (year) {
    year.textContent = String(new Date().getFullYear());
  }

  /* Countdown to next kickoff */
  var box = document.querySelector("[data-countdown]");
  if (box) {
    var target = box.closest(".countdown");
    var iso = target && target.getAttribute("data-kickoff");

    var tick = function () {
      if (!iso) return;
      var diff = new Date(iso).getTime() - Date.now();

      if (isNaN(diff) || diff <= 0) {
        box.textContent = "Kickoff!";
        return;
      }

      var d = Math.floor(diff / 86400000);
      var h = Math.floor((diff % 86400000) / 3600000);
      var m = Math.floor((diff % 3600000) / 60000);
      var s = Math.floor((diff % 60000) / 1000);

      box.textContent =
        (d > 0 ? d + "d " : "") +
        String(h).padStart(2, "0") + ":" +
        String(m).padStart(2, "0") + ":" +
        String(s).padStart(2, "0");
    };

    tick();
    setInterval(tick, 1000);
  }
})();