class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @item_all = Item.all
    route = Rails.application.routes.recognize_path(request.referer)
    if route == {:controller => "admin/home", :action => "index"}
       @items = Item.page(params[:page]).per(10)
    else
       @item = Item.where(genre: params[:genre])
       @items = @item.page(params[:page]).per(10)
    end
  end

  def show
  	@item = Item.find(params[:id])
    @comments = @item.comments.page(params[:page]).per(10)
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
