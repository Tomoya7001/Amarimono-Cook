class Public::HomesController < ApplicationController
  def top
    @cooks = Cook.order(created_at: :desc).limit(4)
  end

  def about
  end

end
