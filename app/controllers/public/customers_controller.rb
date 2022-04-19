class Public::CustomersController < ApplicationController

  def show
    @customers = Customer.all
    @customer = current_customer
    @cooks = @customer.cooks
  end

  def index
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

end
