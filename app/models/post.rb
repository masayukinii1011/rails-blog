class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    # commentモデルを複数持つ
    # postを削除すると紐付いたモデル(comment)も削除
    validates :title, presence: true, length: {minimum: 3}
    validates :body, presence: true
    #バリデーション
end
