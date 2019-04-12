class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @post.comments.create(comment_params)
        redirect_to post_path(@post)
        # 渡ってきたパラメータの:post_idカラムをPostモデルから探す(post_idカラムのあるCommentモデルはPostモデルに紐づく)
        # comment_paramsからcommentsを作成
        # そのshowテンプレートにリダイレクト
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    private
        def comment_params
            params.require(:comment).permit(:body)
        end
    # Strong Parameters(フォームから渡ってきたパラメータを強めにチェック！)

end
