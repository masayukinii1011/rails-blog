class PostsController < ApplicationController
    PER = 10

    def index
        @posts = Post.page(params[:page]).per(PER).order(created_at: 'desc')
    end

    def show
        @post = Post.find(params[:id])
    end

end
