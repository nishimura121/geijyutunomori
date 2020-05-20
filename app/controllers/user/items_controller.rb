class User::ItemsController < ApplicationController
  impressionist :actions=> [:show]

  def index
    @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(3)
    @genre = Genre.find(params[:genre_id])
    @user = User.find(current_user.id)

#レベル機能
    @exp1 = Item.where(user_id: current_user.id).all.count * 10
    @exp2 = Comment.where(user_id: current_user.id).all.count
    @exp3 = @user.follower.count
    @exp4 = @user.followed.count
    @exp5 = @user.favorites.count
    @user.exp_sum = @exp1.to_i + @exp2.to_i + @exp3.to_i + @exp4.to_i + @exp5.to_i
    @user.level = @user.exp_sum.to_i / 10 + 1
    current_user.update(exp_sum: @user.exp_sum, level: @user.level)
  end


  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.page(params[:page]).per(3)
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

  def ranking
    # @items = Item.find(Bookmark.group(:item_id).order('count(item_id) desc').limit(10).pluck(:item_id))
    # binding.pry
    # @items = Item.find(
    #   Item.joins(:bookmarks)
    #     .eager_load(:bookmarks)
    #     .where(items: { genre_id: params[:genre_id] })
    #     .group("bookmarks.items_id")
    #     .order("count(bookmarks.item_id) desc")
    #     .limit(10)
    #     .select("items.id, count(bookmarks.item_id)")
    #     .pluck("items.id")
    # )
    # Actress.joins(:movies).eager_load(:movies).where(movies: { year: 2013 })
    # [
    #   {id, 1},
    #   {id, 2},
    # ].pluck(:id) == [1,2]
    item_ids = Item.where(genre_id: params[:genre_id]).pluck(:id)
    bookmark_item_ids = Bookmark.where(item_id: item_ids).group(:item_id).order('count(item_id) desc').limit(10).pluck(:item_id)
    @items = Item.find(bookmark_item_ids)
    @genres = Genre.all
  end


# @genre_id = request.query_parameters[:genre_id].to_i
   # @items = Item.where(genre_id: @genre_id).where(id: Bookmark.group(:item_id).order('count(item_id) desc'))
   # @bookmark = Bookmark.group(:item_id).order('count(item_id) desc')
   # .find(Bookmark.group(:item_id).order('count(item_id) desc').limit(10).pluck(:item_id))

  private
   def item_params
    params.require(:item).permit(:name, :description, :image, :genre_id, :content)
   end

end
