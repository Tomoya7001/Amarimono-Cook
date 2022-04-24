class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about]
  #before_action :current_customer.email == "guest@guest.com", only: [:show, :index]

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

  def followers
    customer = Customer.find(params[:id])
    @customers = customer.followers
  end

  def followeds
    customer = Customer.find(params[:id])
    @customers = customer.followeds
  end

  def update
    if guest?
      redirect_to
    end

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
    params.require(:customer).permit(:name, :email, :image, :is_deleted)
  end

end
