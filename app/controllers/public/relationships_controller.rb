class Public::RelationshipsController < ApplicationController
  before_action :authenticate_customer!
  #フォローするとき
  def create
    if current_customer.email == "guest@guest.com"
      redirect_to root_path, notice: 'ゲストログインではこちらの機能は使えません。'
    else
      current_customer.follow(params[:customer_id])
      redirect_to request.referer
    end
  end
  #フォロー外すとき
  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end

  #フォロー一覧
  def followings
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings
  end
  #フォロワー一覧
  def followers
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
  end
end
