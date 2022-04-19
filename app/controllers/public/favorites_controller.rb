class Public::FavoritesController < ApplicationController

  def create
    cook = Cook.find(params[:cook_id])
    favorite = current_customer.favorites.new(cook_id: cook.id)
    favorite.save
    redirect_to public_cooks_path(cook)
  end

  def destroy
    cook = Cook.find(params[:cook_id])
    favorite = current_customer.favorites.find_by(cook_id: cook.id)
    favorite.destroy
    redirect_to public_cooks_path(cook)
  end

end
