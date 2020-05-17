class Admin::ItemsController < ApplicationController
  def index
  	@items = Item.all
  	@genres = Genre.all
  end

  def show
  	@item = Item.find(params[:id])
    @comments = @item.comments
    impressionist(@item)
  end

  def destroy
  	@item = Item.find(params[:id])
    if @item.destroy
      redirect_to admin_items_path
    end
  end
end
