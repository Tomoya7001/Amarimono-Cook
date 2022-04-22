class Public::SearchesController < ApplicationController

  def search
    @genre = params[:genre]
    @records = Cook.search_fo(@genre)
  end

end
