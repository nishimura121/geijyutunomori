class User::CommentsController < ApplicationController

  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.item_id = params[:item_id]
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
   def comment_params
    params.require(:comment).permit(:content)
   end
end



