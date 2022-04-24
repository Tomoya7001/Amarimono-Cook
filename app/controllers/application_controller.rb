class ApplicationController < ActionController::Base
  #ゲストユーザーの制限
  def guest_customer
    if current_customer.email == "guest@guest.com"
    redirect_to root_path, notice: 'ゲストログインではこちらの機能は使えません。'
    end
  end

end
