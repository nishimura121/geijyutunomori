class Admin::CommentsController < ApplicationController
  def destroy
  	comment = Comment.find(params[:item_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end
end
