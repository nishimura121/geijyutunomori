class User::UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @items = @user.items
  end

  def new
    @genres = Genre.all
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
