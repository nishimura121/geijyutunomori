class Admin::ItemsController < ApplicationController
  def index
    @item = Item.where(genre_id: params[:id])
    @items = @item.page(params[:page]).per(5)
    # @genre = Genre.all
  end

  def show
  	@item = Item.find(params[:id])
    @comments = @item.comments.page(params[:page]).per(5)
    impressionist(@item)
  end

  def destroy
  	@item = Item.find(params[:id])
    if @item.destroy
      redirect_to admin_user_path(current_user)
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path
    else
      render action: :edit
    end
  end

  private
   def item_params
    params.require(:item).permit(:name, :description, :image, :genre_id, :content)
   end
end
