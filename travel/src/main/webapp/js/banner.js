"use strict";

const bannerBox = document.querySelector("#bannerBox > ul");
const bannerItem = document.querySelectorAll(".banner_item");
//배열 반환

const prevBtn = document.getElementById("prevBtn");
const nextBtn = document.getElementById("nextBtn");
const conatiner = document.getElementById("container");

const size = bannerItem[0].clientWidth;
let counter = 0;
let num = 0;
nextBtn.addEventListener("click", () => {
  if (counter < bannerItem.length - 1) {
    counter++;
    bannerBox.style.transform = "translateX(" + -size * counter + "px)";
  } else if (counter == bannerItem.length - 1) {
    counter = 0;
    bannerBox.style.transform = "translateX(" + -size * counter + "px)";
  }
  if (counter == 1) {
    conatiner.style.backgroundColor = "rgb(160, 200, 240)";
  } else if (counter == 2) {
    conatiner.style.backgroundColor = "rgb(247, 218, 173)";
  } else if (counter == 0) {
    conatiner.style.backgroundColor = "rgb(250,235,230)";
  }
});

prevBtn.addEventListener("click", () => {
  if (counter > 0) {
    counter--;
    bannerBox.style.transform = "translateX(" + -size * counter + "px)";
  }
  if (counter == 1) {
    conatiner.style.backgroundColor = "rgb(160, 200, 240)";
  } else if (counter == 2) {
    conatiner.style.backgroundColor = "rgb(247, 218, 173)";
  } else if (counter == 0) {
    conatiner.style.backgroundColor = "rgb(250,235,230)";
  }
});
setInterval(() => {
  if (counter < bannerItem.length - 1) {
    counter++;
    bannerBox.style.transform = "translateX(" + -size * counter + "px)";
  } else if (counter == bannerItem.length - 1) {
    counter = 0;
    bannerBox.style.transform = "translateX(" + -size * counter + "px)";
  }
  if (counter == 1) {
    conatiner.style.backgroundColor = "rgb(160, 200, 240)";
  } else if (counter == 2) {
    conatiner.style.backgroundColor = "rgb(247, 218, 173)";
  } else if (counter == 0) {
    conatiner.style.backgroundColor = "rgb(250,235,230)";
  }
}, 5000);
