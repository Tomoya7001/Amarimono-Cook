class Public::CooksController < ApplicationController

  def index
    #@cook = Cook.find(params[:id])
    @cooks = Cook.all
  end

  def show
    @cook = Cook.find(params[:id])
  end

  def edit
    @cook = Cook.find(params[:id])
    @genres = Genre.all
  end

  def update
    @cook = Cook.find(params[:id])
    @cook.update(cook_params)
    redirect_to public_cooks_path(cook.id)
  end

  #投稿
  def new
    @cook = Cook.new
    @genres = Genre.all
  end

  #投稿データを保存する
  def create
    @cook = Cook.new(cook_params)
    @cook.customer_id = current_customer.id
    pp @cook.image
    @cook.save
    redirect_to public_cooks_path
  end

  #編集
  def update
    @cook = Cook.find(params[:id])
    if @cook.update(cook_params)
      redirect_to public_cook_path
    else
      render :edit
    end
  end

  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy
    redirect_to public_my_page_path
  end

  private

  #投稿データのストロングパラメータ
  def cook_params
    params.require(:cook).permit(:cook_name, :image, :introduction, :customer_id, :genre_id)
  end

end