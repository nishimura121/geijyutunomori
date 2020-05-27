class Admin::HomeController < ApplicationController
  before_action :authenticate_admin!

  def index
    @item_all = Item.all
    @user_all = User.where(is_cancel:false)

  	range = Time.current.beginning_of_day..Time.current.end_of_day
  	@items = Item.where(created_at: range)

  	@items1 = Item.where(genre_id:1)
  	@itemsA = @items1.where(created_at: range)
  	@items2 = Item.where(genre_id:2)
  	@itemsB = @items2.where(created_at: range)
  	@items3 = Item.where(genre_id:3)
  	@itemsC = @items3.where(created_at: range)
  	@items4 = Item.where(genre_id:4)
  	@itemsD = @items4.where(created_at: range)
  	@items5 = Item.where(genre_id:5)
  	@itemsE= @items5.where(created_at: range)
  	@users = User.where(created_at: range)
  	@comments = Comment.where(created_at: range)
  end

  def show
  end
end
