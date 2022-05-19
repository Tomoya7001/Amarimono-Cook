// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
//レビュー機能の為コメントアウト
//import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
//swiper導入
//import Swiper from 'swiper/swiper-bundle.esm.js';
//import 'swiper/swiper-bundle.css';

Rails.start()
//Turbolinks.start()
ActiveStorage.start()

window.$ = window.jQuery = require('jquery');
require('packs/raty')

//swiper導入
//= require swiper/swiper-bundle.min.js
//= require swiper.js