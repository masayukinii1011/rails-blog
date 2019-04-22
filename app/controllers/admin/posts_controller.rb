class Admin::PostsController < Admin::ApplicationController
  PER = 10

  def index
    @posts = Post.page(params[:page]).per(PER).order(created_at: 'desc')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_root_path, notice: 'Created successfully.'
    else
      flash.alert = 'Failed to create post.'
      @post = Post.new(post_params)
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_root_path, notice: 'Updated successfully.'
    else
      flash.alert = 'Failed to update.'
      redirect_to edit_admin_post_path(@post)
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = 'Deleted.'
      redirect_back(fallback_location: admin_root_path)
    else
      flash.alert = 'Failed to delete.'
      redirect_back(fallback_location: admin_root_path)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :published)
  end
end

