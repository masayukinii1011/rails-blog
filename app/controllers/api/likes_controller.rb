class Api::LikesController < ActionController::API
  def index
    render json: Like.filter_by_post(params[:post_id]).select(:id, :post_id)
  end

  def create
    Like.create!(likes_params)
    head :created
  end

  private
  def likes_params
    params.require(:like).permit(:post_id)
  end

end
