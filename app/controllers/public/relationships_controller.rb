class Public::RelationshipsController < ApplicationController
  #フォローするとき
  def create
    current_user.follow(params[:customer_id])
    redirect_to request.referer
  end
  #フォロー外すとき
  def destory
    current_user.unfollow(params[:customer_id])
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
