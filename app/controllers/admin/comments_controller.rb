class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
  	comment = Comment.find(params[:item_id])
    if comment.destroy
    redirect_to admin_item_path
    else
    render action: :show
    end
  end
end
