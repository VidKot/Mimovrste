class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def add_post
    post = Post.find(params[:post_id])  # Ensure the post_id is in the params
    cart = current_user.cart

    # Check if the post is already in the cart
    unless cart.posts.include?(post)
      cart.posts << post
    end

    redirect_to cart_path(cart), notice: 'Post added to cart!'
  end

  def remove_post
    post = Post.find(params[:post_id])
    cart = current_user.cart

    cart.posts.delete(post)
    redirect_to cart_path(cart), notice: 'Post removed from cart.'
  end
end