class Public::CookCommentsController < ApplicationController

  def index
    @cook_comment = CookComment.new
    @cook = Cook.find(params[:cook_id])
    @cook_comments = @cook.cook_comments
  end

  def create
    cook = Cook.find(params[:cook_id])
    comment = current_customer.cook_comments.new(cook_comment_params)
    comment.cook_id = cook.id
    comment.save
    redirect_to public_cook_cook_comments_path(cook)
  end

  def destroy
    CookComment.find(params[:id]).destroy
    redirect_to public_cook_cook_comments_path(params[:cook_id]), notice: 'コメントを削除しました'
  end

  private

  def cook_comment_params
    params.require(:cook_comment).permit(:comment)
  end

end
