const menuIcon = document.querySelector("div.icon");
const hamburgerIcon = document.querySelector("i.fa-solid");
const navigation = document.querySelector("nav");
const header = document.querySelector("header");


menuIcon.addEventListener("click", (event) => {
    if (hamburgerIcon.classList[1] === "fa-bars") {
        hamburgerIcon.classList.remove("fa-bars");
        hamburgerIcon.classList.add("fa-xmark");
        navigation.style.display = "block";
        header.style.height = "40vh";
    } else {
        hamburgerIcon.classList.remove("fa-xmark");
        hamburgerIcon.classList.add("fa-bars");
        navigation.style.display = "none";
        header.style.height = "25vh";
    }
});