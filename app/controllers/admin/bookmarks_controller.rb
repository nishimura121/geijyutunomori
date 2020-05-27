class Admin::BookmarksController < ApplicationController
	before_action :authenticate_admin!

  def index
    @bookmarks = User.find(params[:user_id]).bookmarks.page(params[:page]).per(10)
   end

   def create
    @item = Item.find(params[:item_id])
    bookmark = @item.bookmarks.new(user_id: current_user.id)
    bookmark.save
    redirect_to request.referer
  end

  def destroy
    @item = Item.find(params[:item_id])
    bookmark = current_user.bookmarks.find_by(item_id: @item.id)
    bookmark.destroy
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
