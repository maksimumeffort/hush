// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import { initMapbox } from '../plugins/init_mapbox';




console.log("Hello from app/javascript/packs/application.js!");

// const button = document.getElementById("toggle");
// button.addEventListener("click", (event) => {
//     console.log(event.)
//     var x = document.getElementById("myDIV");
//     if (x.style.display === "none") {
//       x.style.display = "block";
//     } else {
//       x.style.display = "none";
//     }
// });
import { initFilter } from '../components/navbar';
import { toggleTourVisibility } from '../components/tours';
import { style } from '../plugins/directions_style';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initFilter();
})
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
