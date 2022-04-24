class Public::CooksController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    #@cook = Cook.find(params[:id])
    #@cooks = Cook.all
    @q = Cook.ransack(params[:q])
    @genres = Genre.all
    @cooks = @q.result(distinct: true)
  end

  def search
    @cooks = @q.result(distinct: true)
    @results = @q.result
  end

  def show
    @cook = Cook.find(params[:id])
    @review = Review.new
  end

  def edit
    @cook = Cook.find(params[:id])
    @genres = Genre.all
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
      redirect_to public_my_page_path
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

  def set_q
    @q = Cook.ransack(params[:q])
  end

  #投稿データのストロングパラメータ
  def cook_params
    params.require(:cook).permit(:cook_name, :image, :introduction, :customer_id, :genre_id)
  end

  def search_params
    params.require(:q).permit(:genre_id_eq)
  end

end