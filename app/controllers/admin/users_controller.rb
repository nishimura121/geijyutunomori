class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user_true = User.where(is_cancel:false)
  	@users = User.all.page(params[:page]).per(10)
  	@genres = Genre.all
  end

  def show
  	@user = User.find(params[:id])
    @comments = @user.comments.page(params[:page]).per(10)
    @items = @user.items.page(params[:page]).per(10)

    #レベル機能
    @exp1 = Item.where(user_id: params[:id]).all.count * 10
    @exp2 = Comment.where(user_id: params[:id]).all.count
    @exp3 = @user.follower.count
    @exp4 = @user.followed.count
    @exp5 = @user.favorites.count
    @user.exp_sum = @exp1.to_i + @exp2.to_i + @exp3.to_i + @exp4.to_i + @exp5.to_i
    @user.level = @user.exp_sum.to_i / 10 + 1
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
