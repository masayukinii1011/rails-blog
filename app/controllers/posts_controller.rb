class PostsController < ApplicationController
    # renderを明示しないときは暗黙的にアクションと同じ名前のビューを返す
    def index
        @posts = Post.all.order(created_at: 'desc')
        # 全てのデータを取得して作成日の新しい順に並び替え
    end

    def show
        @post = Post.find(params[:id])
        # 渡ってきたパラメータの:idカラムをPostモデルから探す
    end

    # new->create
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path
        else
            render 'new'
        end
        # post_paramsの返り値でPostモデルに新規登録
        # 保存がうまくいけば(Postモデルでバリデーション)
        # indexのパスにリダイレクト
        # 保存がうまくいかなければnewテンプレートを返す(エラーメッセージ表示)
    end

    #edit->update
    def edit
        @post = Post.find(params[:id])
        # 渡ってきたパラメータの:idカラムをPostモデルから探す
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to posts_path
        else
            render 'edit'
        end
         # 渡ってきたパラメータの:idカラムをPostモデルから探す
         # post_paramsの返り値で更新できれば
         # indexのパスにリダイレクト
         # うまくいかなければeditテンプレートを返す
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
        # 渡ってきたパラメータの:idカラムをPostモデルから探す
        # 消す
        # indexのパスにリダイレクト
    end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end
    # Strong Parameters(フォームから渡ってきたパラメータを強めにチェック！)
end
