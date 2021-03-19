const initFilter = () => {

  const filter_icon = document.querySelector("#filter");
  const filters_container = document.querySelector("#filters_container");
  const filter = document.querySelectorAll(".filter-button")
  const filter_form = document. querySelector(".filter_form")
  const filt_s = document.querySelector(".filt_search");

filt_s.addEventListener("click", () => {
  filt_s.classList.toggle("btn-success");
  filt_s.classList.toggle("btn-outline-success");

});

filter.forEach(f => {
  f.addEventListener("click",(e) => {
  e.target.classList.toggle("btn-outline-success")
  e.target.classList.toggle("btn-success")
  })
});
  filter_icon.addEventListener("click", () => {
    filters_container.classList.toggle("d-block");
  });


};

export { initFilter };
