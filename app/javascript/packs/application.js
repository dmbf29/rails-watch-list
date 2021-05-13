// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';
import 'owl.carousel/dist/assets/owl.carousel.css';
import 'owl.carousel';

Rails.start()
Turbolinks.start()
ActiveStorage.start()


document.addEventListener('turbolinks:load', () => {
  $('.owl-carousel').owlCarousel({
    // stagePadding: 8,
    loop: true,
    margin: 10,
    responsive:{
      0:{
        items:1
       },
      600:{
       items:3
       },
      1000: {
          items: 5
      }
     },
     nav: true,
     navText: ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"]
   })
});

import "controllers"
