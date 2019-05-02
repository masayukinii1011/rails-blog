import 'babel-polyfill'
import Rails from 'rails-ujs'
import Vue from 'vue'
import TopButton from '../components/TopButton.vue'
import LikeButton from '../components/LikeButton.vue'
import '../stylesheets/application.scss'

Rails.start()

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#app',
        components: { LikeButton, TopButton }
    })
})
