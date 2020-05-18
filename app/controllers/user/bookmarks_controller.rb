class User::BookmarksController < ApplicationController
  def index
    # @bookmarks = Bookmark.where(user_id: user_id)
    @bookmarks = Bookmark.where(@user)
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


