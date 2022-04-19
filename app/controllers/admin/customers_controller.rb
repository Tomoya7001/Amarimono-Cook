class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
  end

  def update
  end

  def edit
  end

end
