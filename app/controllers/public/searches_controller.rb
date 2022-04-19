class Public::SearchesController < ApplicationController

  def search
    @genres = Genre.all
  end

end
