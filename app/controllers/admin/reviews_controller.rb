class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.find(params[:id])
  end

  def show
  end

  def destroy
    @revirew = Review.find(params[:id])
    @review.destroy
    redirect_to public_cook_reviews, notice: 'レビューを削除しました'
  end

end
