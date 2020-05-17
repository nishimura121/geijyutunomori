class User::CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = user_id
    @comment.item_id = params[:item_id]
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

   def destroy
    comment = Comment.find(params[:item_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end


  private
   def comment_params
    params.require(:comment).permit(:content)
   end

end
