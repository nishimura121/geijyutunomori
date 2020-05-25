class User::UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @items = @user.items.page(params[:page]).per(10)

#レベル機能
    @exp1 = Item.where(user_id: current_user.id).all.count * 10
    @exp2 = Comment.where(user_id: current_user.id).all.count
    @exp3 = @user.follower.count
    @exp4 = @user.followed.count
    @exp5 = @user.favorites.count
    @user.exp_sum = @exp1.to_i + @exp2.to_i + @exp3.to_i + @exp4.to_i + @exp5.to_i
    @user.level = @user.exp_sum.to_i / 10 + 1
    current_user.update(exp_sum: @user.exp_sum, level: @user.level)
  end

  def new
    @genres = Genre.all
  end

  def edits
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
     redirect_to user_path
    else
      render action: :edits
    end
  end

##退会ボタンを押す
  def destroy
    @user = User.find(current_user.id)
    @user.toggle!(:is_cancel)
    reset_session
    redirect_to root_path
  end


  # redirect_to :back

##退会確認ページの表示
  def cancels
    @user = User.find(current_user.id)
  end

  def follows
  end

  def followers
  end

private
  def user_params
    params.require(:user).permit(:name, :age, :prefecture, :hp_address, :sns_address, :self_introduction, :email, :profile_image, :is_cancel)
  end
end

