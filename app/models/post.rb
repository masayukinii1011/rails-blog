class Post < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    has_many :likes, dependent: :destroy
end
