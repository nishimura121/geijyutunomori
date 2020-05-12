class User::ItemsController < ApplicationController
  def index
    @item =Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @genre = Genre.find(item_params[:name])
    @item.genre_id = @genre.id
    if @item.save
      redirect_to users_item_path(@item)
    else
      render action: :new
    end
  end

  private
   def item_params
    params.require(:item).permit(:name, :description, :image, :genre_id)
   end
end
