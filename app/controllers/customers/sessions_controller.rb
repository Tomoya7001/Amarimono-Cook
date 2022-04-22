class Customers::SessionsController < Devise::SessionsController
  # ゲストログイン用
  def new_guest
    customer = Customer.guest
    sign_in customer   # ユーザーをログインさせる
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end