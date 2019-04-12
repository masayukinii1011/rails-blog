Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  # commentsコントローラはpostsコントローラに紐づく
  # createとdestroyしか使わない

  # posts     GET /posts(.:format) posts#index
  # posts　   POST /posts(.:format) posts#create
  # new_post  GET /posts/new(.:format) posts#new
  # edit_post GET /posts/:id/edit(.:format) posts#edit
  # post      GET /posts/:id(.:format) posts#show
  # post      PATCH /posts/:id(.:format) posts#update
  # post      PUT /posts/:id(.:format) posts#update
  # post      DELETE /posts/:id(.:format) posts#destroy

  # new->create
  # edit->update

  # post_comments GET /posts/:post_id/comments(.:format) comments#index
  # post_comments POST /posts/:post_id/comments(.:format) comments#create
  # new_post_comment GET /posts/:post_id/comments/new(.:format) comments#new
  # edit_post_comment GET /posts/:post_id/comments/:id/edit(.:format) comments#edit
  # post_comment GET /posts/:post_id/comments/:id(.:format) comments#show
  # post_comment PATCH /posts/:post_id/comments/:id(.:format) comments#update
  # post_comment PUT /posts/:post_id/comments/:id(.:format)  comments#update
  # post_comment DELETE /posts/:post_id/comments/:id(.:format)comments#destroy

  root 'posts#index'
  # rootパスではpostsコントローラのindexメソッドを呼ぶ
end
