class User::HomeController < ApplicationController
  def index
  	@items = Item.all.page(params[:page]).per(10).reverse_order
  end

  def show
  end
end
