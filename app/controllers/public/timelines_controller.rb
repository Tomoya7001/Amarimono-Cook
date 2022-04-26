class Public::TimelinesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cooks = Cook.where(customer_id: [*current_customer.following_ids])
  end

  def create
    if current_customer.email == "guest@guest.com"
      redirect_to root_path, notice: 'ゲストログインではこちらの機能は使えません。'
    else
      cook = Cook.find(params[:cook_id])
      favorite = current_customer.favorites.new(cook_id: cook.id)
      favorite.save!
      redirect_to public_customer_timelines_path(cook)
    end
  end

  def destroy
    cook = Cook.find(params[:cook_id])
    favorite = current_customer.favorites.find_by(cook_id: cook.id)
    favorite.destroy
    redirect_to public_customer_timelines_path(cook)
  end

end
