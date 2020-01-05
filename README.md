# README

### Ruby on Rails
[Ruby on Rails](https://rubyonrails.org/)
MVCフレームワークの理解のため、Ruby on Railsでブログを作成しました。
ログインしていなくても記事の閲覧は可能。
ログインすると記事投稿及び削除が可能になります。

### Vue.js
部分的にVue.jsを導入。
Vue.jsで"いいねボタン"と"トップに戻るボタン"を実装しています。
- いいねボタン
参考記事：
https://qiita.com/TakeshiFukushima/items/a6c698fec648c11eee9a
- トップに戻るボタン
参考記事：
https://www.tomotanuki.com/entry/web-top-of-page

### Gem
#### Devise
ログイン認証
参考記事：
https://qiita.com/yoshimitsu41/items/ba5487e18278822828a3

#### Kaminari
ページネーション
参考記事：
https://qiita.com/residenti/items/1ae1e5ceb59c0729c0b9

#### Webpacker
Ruby on RailsにはSprocketsというモジュールによって、JavaScript,CSS,画像などのアセットを管理する事ができる機能"Asset Pipeline"が最初から備わっています。
しかしVue.jsを使用するにあたり、Webpackを使ってJSファイルの管理をしたく、Rails版Webpack、"Webpacker"を使用しています。
参考記事：
https://qiita.com/hiyamamoto/items/e0a30b4799314174b80f

Asset Pipelineを切り、JSの管理をWebpackerに一本化すると、data-confirmが効かなくなりました。
data-confirmは記事削除ボタンの確認ダイアログに使用しています。
rails-ujsモジュールをWebpackerで管理できるよう読み込ませることで解決しました。
参考記事：
https://qiita.com/mokuo/items/a50a27a83c3328c116a7

### Heroku
インフラはHerokuを使用しています。
参考記事：
https://qiita.com/kazukimatsumoto/items/a0daa7281a3948701c39
