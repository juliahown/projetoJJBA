const carousel = document.querySelector(".carousel"),
firstImg = carousel.querySelectorAll("img")[0];
arrowIcons = document.querySelectorAll(".wrapper i");

let isDragStart = false, prevPageX, prevScrollLeft;
let firstImgWidth = firstImg.clientWidth + 14; // Largura e margem fixa em 14 pixels


arrowIcons.forEach(icon => {
    icon.addEventListener("click", () => { // Executou a função
        carousel.scrollLeft += icon.id == "left" ? -firstImgWidth : firstImgWidth;
    })
});
