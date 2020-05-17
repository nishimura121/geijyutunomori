class User::ItemsController < ApplicationController
  impressionist :actions=> [:show]

  def index
    @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(3)
    @genre = Genre.find(params[:genre_id])
    @user = User.find(current_user.id)
  end



  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments
    impressionist(@item)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to user_path(current_user)
    else
      render action: :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to user_path(current_user)
    end
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to new_item_path
    else
      render action: :new
    end
  end


  private
   def item_params
    params.require(:item).permit(:name, :description, :image, :genre_id, :content)
   end

end
