class AddPriceAndContactToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :price, :string
    add_column :posts, :contact, :string
  end
end
