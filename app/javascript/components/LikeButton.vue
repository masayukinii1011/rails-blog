<template>
  <p class="like-btn float-btn" @click="registerLike()">
    Like！ {{ count }}
  </p>
</template>

<script>
// axios と rails-ujsのメソッドインポート
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
// CSRFトークンの取得とリクエストヘッダへの設定をしてくれます
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  // propsでrailsのviewからデータを受け取る
  props:['postId'],
  data() {
    return {
      likeList: []  // いいね一覧を格納するための変数
    }
  },
  // 算出プロパティ
  computed: {
    // いいね数を返す
    count() {
      return this.likeList.length
    },
  },
  // Vueインスタンスの作成・初期化直後に実行される
  created: function() {
    this.fetchLikeByPostId().then(result => {
      this.likeList = result
    })
  },
  methods: {
    // rails側のindexアクションにリクエストするメソッド
    fetchLikeByPostId: async function() {
      const res = await axios.get(`/api/likes/?post_id=${this.postId}`)
      if (res.status !== 200) { process.exit() }
      return res.data
    },
    // rails側のcreateアクションにリクエストするメソッド
    registerLike: async function() {
      const res = await axios.post('/api/likes', { post_id: this.postId })
      if (res.status !== 201) { process.exit() }
      this.fetchLikeByPostId().then(result => {
          this.likeList = result
      })
    }
  }
}
</script>