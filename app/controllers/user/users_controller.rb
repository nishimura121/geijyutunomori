class User::UsersController < ApplicationController
  def show
    # binding.pry
  	@user = User.find_by(params[:user_id])
  	@item = Item.where(user_id: user_id)
  end

  def new
  end

##退会ボタンを押す
  def destroy
    @user = User.find(current_user.id)
    @user.toggle!(:is_cancel)
    reset_session
    redirect_to root_path
  end

##退会確認ページの表示
  def cancel
    @user = User.find(current_user.id)
  end
  # ***_path
  # index action
  # show action
end
