class Public::CooksController < ApplicationController

  def index
    @cooks = Cook.all
  end

  def show
    @cook = Cook.find(params[:id])
  end

  def edit
    @cook = Cook.find(params[:id])
  end

  def update
    @cook = Cook.find(params[:id])
    @cook.update(cook_params)
    redirect_to public_cooks_path(cook.id)
  end

  def new
    @cooks = Cook.new
    @genre = Genre.all
  end

  #投稿データを保存する
  def create
    @cook = Cook.new(cook_params)
    @cook.customer_id = current_customer.id
    @cook.save
    redirect_to public_cooks_path
  end

  private

  #投稿データのストロングパラメータ
  def cook_params
    params.require(:cook).permit(:cook_name, :image_id, :introduction, :customer_id, :genre_id)
  end

end