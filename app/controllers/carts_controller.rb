class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def add_post
    unless params[:post_id].present?
      flash[:alert] = "Post ID is missing."
      redirect_to root_path and return
    end
  
    post = Post.find_by(id: params[:post_id])
    unless post
      flash[:alert] = "Post not found."
      redirect_to root_path and return
    end
  
    cart = current_user.cart || current_user.create_cart  # Ensure cart exists
  
    # Check if post is already in cart
    if cart.posts.exists?(post.id)
      flash[:notice] = "Post is already in your cart."
      redirect_to cart_path(cart) and return
    end
  
    cart.posts << post  # Add post to the cart
    if cart.save
      flash[:notice] = "Post added to cart!"
    else
      flash[:alert] = "Failed to add post to cart."
    end
  
    redirect_to cart_path(cart)
  end

  def remove_post
    cart = current_user.cart
    post = Post.find_by(id: params[:post_id])
  
    if cart && post
      cart.posts.delete(post)
      flash[:notice] = "Post removed from cart."
    else
      flash[:alert] = "Post could not be removed."
    end
  
    redirect_to cart_path(cart)
  end
  
end