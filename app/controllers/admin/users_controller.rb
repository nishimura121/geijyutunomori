class Admin::UsersController < ApplicationController
  def index
  	@users = User.all
  	@genres = Genre.all
  end

  def show
  	@user = User.find(params[:id])
  	@item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end
end
