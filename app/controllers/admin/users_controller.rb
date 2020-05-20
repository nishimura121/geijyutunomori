class Admin::UsersController < ApplicationController
  def index
  	@users = User.all
  	@genres = Genre.all
  end

  def show
  	@user = User.find(params[:id])
    @comments = @user.comments.page(params[:page]).per(3)
    @items = @user.items.page(params[:page]).per(3)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to admin_user_path
    else
      render action: :edit
    end
  end

private
  def user_params
   params.require(:user).permit(:name, :age, :prefecture, :hp_address, :sns_address, :self_introduction, :email, :profile_image, :is_cancel)
  end

end
