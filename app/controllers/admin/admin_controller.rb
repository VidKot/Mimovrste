
class AdminController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all
  end

  def toggle_admin
    user = User.find(params[:id])
    user.update(admin: !user.admin?)
    redirect_to admin_dashboard_path, notice: "User admin status updated."
  end

  def delete_user
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_dashboard_path, notice: "User deleted."
  end
end

