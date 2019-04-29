/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'babel-polyfill'
import Rails from 'rails-ujs'
import Vue from 'vue'
import vueSmoothScroll from 'vue-smooth-scroll'
import TopButton from '../components/TopButton.vue'
import LikeButton from '../components/LikeButton.vue'
import '../stylesheets/application.scss'

Rails.start()
Vue.use(vueSmoothScroll)

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#app',
        components: { LikeButton, TopButton }
    })
    //スクロール量を取得する関数
    function getScrolled() {
        return (window.pageYOffset !== undefined) ? window.pageYOffset : document.documentElement.scrollTop
    }

    //トップに戻るボタンの要素を取得
    const topBtn = document.querySelector('.top-btn')

    //ボタンの表示・非表示
    window.onscroll = function () {
        (getScrolled() > 200) ? topBtn.classList.add('fade-in') : topBtn.classList.remove('fade-in');
    }
})
