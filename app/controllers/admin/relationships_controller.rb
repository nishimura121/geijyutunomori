class Admin::RelationshipsController < ApplicationController
  before_action :authenticate_admin!

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def follower
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(10)
  end

  def followed
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(10)
  end
end
