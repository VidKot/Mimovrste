class Post < ApplicationRecord
  has_rich_text :body
  has_rich_text :contact
  has_one_attached :picture
  has_many :cart_items
  has_many :carts, through: :cart_items
end
