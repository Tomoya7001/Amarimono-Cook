class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about]

  def show
    @customers = Customer.all
    @customer = current_customer
    @cooks = @customer.cooks
  end

  def index
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to public_my_page_path
  end

  #退会
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :is_deleted)
  end

end
