class UsersController < ApplicationController

  #users_controller.rb
  def show
    @user = User.find(params[:id])
    @user_posts = Post.all.order('created_at DESC').where(author_id: current_user)
  end

  def index
    @users = User.all
  end

end