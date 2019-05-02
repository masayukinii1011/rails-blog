<template>
    <p class="top-btn" v-bind:class="{'fade-in':isActive }">
        <a href="#top" v-smooth-scroll><i class="fas fa-angle-up"></i></a>
    </p>
</template>

<script>
import Vue from 'vue'
import vueSmoothScroll from 'vue-smooth-scroll'
Vue.use(vueSmoothScroll)

export default {
  data: () => {
    return {isActive: false}
  },
  methods: {
    //スクロール量を取得
    getScrolled() {
      return (window.pageYOffset !== undefined) ? window.pageYOffset : document.documentElement.scrollTop
    },
    //クラス付け替え
    toggleFadeIn() {
      (this.getScrolled() > 200) ? this.isActive = true : this.isActive = false
    }
  },
  //スクロールしたら呼び出し
  mounted() {
    window.onscroll = this.toggleFadeIn
  }
}
</script>
