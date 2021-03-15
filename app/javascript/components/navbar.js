const filter = document.querySelector("#filter");
const filters_container = document.querySelector("#filters_container");

filter.addEventListener("click", (event) => {
  filters_container.classList.toggle("d-block");
});
