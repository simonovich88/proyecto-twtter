class HomeController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
  end

  def tweets
    @tweets = current_user.tweets.order('created_at DESC').page(params[:page]).per(50)
  end

  def follow
    @user = User.find(params[:id])
    current_user.followings << @user
    redirect_to root_path
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.given_follows.find_by(followed_user_id: @user.id).destroy
    redirect_to root_path
  end
  
end
