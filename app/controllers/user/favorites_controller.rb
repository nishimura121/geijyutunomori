class User::FavoritesController < ApplicationController
	before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    favorite = @item.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @item = Item.find(params[:item_id])
    favorite = current_user.favorites.find_by(item_id: @item.id)
    favorite.destroy
    redirect_to request.referer
  end

  private
  def redirect
    case params[:redirect_id].to_i
    when 0
      redirect_to items_path
    when 1
      redirect_to item_path(@item)
    end
  end
end
