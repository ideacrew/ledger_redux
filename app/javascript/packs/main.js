var menuToggle = document.querySelector('#menu-toggle');
menuToggle.addEventListener("click", function(e) {
  e.preventDefault();
  document.querySelector(".sidebar-wrapper").classList.toggle("toggled");
});
