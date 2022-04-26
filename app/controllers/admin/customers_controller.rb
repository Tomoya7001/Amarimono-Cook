class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    if @customers.update(customer_params)
      redirect_to admin_customer_path(@customers)
    else
      render "edit"
    end
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :is_deleted)
  end

end
