class Post < ApplicationRecord
  has_rich_text :body
  has_many :comments
  has_one_attached :picture
end
