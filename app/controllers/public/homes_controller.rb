class Public::HomesController < ApplicationController
  def top
    @cooks = Cook.order(created_at: :desc).limit(4)
    #いいねランキング上位４
    @rank = Cook.find(Favorite.group(:cook_id).order("count(cook_id) desc").limit(4).pluck(:cook_id))
    #@cook = Cook.find(params[:id])
  end

  def about
  end

end
