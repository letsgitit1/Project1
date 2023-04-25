const menuItems = document.querySelectorAll(".menu-item");

menuItems.forEach(function (menuItem) {
  const subMenu = menuItem.querySelector(".sub-menu");
  const subMenuItems = subMenu.querySelectorAll(".sub-menu-item");
  const nextIcon = document.getElementById("nav_icon");
  let isMouseOverTrigger = false;
  let isMouseOverMenu = false;
  subMenuItems.forEach(function (subMenuItem) {
    const subSubMenu = subMenuItem.querySelector(".sub-sub-menu");
    if (subSubMenu) {
      subMenuItem.addEventListener("mouseover", function () {
        subSubMenu.style.display = "block";
        //nextIcon.style.transform = "rotate(90deg)";
        isMouseOverMenu = true;
      });
      subMenuItem.addEventListener("mouseout", function () {
        subSubMenu.style.display = "none";
        ///nextIcon.style.transform = "rotate(-90deg)";
        isMouseOverMenu = false;
      });
    }
  });
});
