class CommentsController < ApplicationController
  before_action :set_post

  def create
    @post.comments.create
    redirect_to @post
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end
  

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
end
