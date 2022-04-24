class Public::ReviewsController < ApplicationController
before_action :authenticate_customer!, only: [:create]

  def index
    @cook = Cook.find(params[:cook_id])
    @reviews = @cook.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to public_cooks_path(@review.cook)
    else
      @cook = Cook.find(params[:cook_id])
      render "public/cooks/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:cook_id, :score, :content, :name)
  end
end
