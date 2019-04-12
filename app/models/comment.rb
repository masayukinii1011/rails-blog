class Comment < ApplicationRecord
  belongs_to :post
  # postモデルに紐づく。rails g時にpost:referencesで生成
  validates :body, presence: true
  # バリデーション
end
