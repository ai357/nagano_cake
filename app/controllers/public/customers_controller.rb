class Public::CustomersController < ApplicationController


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def create
  end

  private

  def customer_params
    params.require(:customer).permit(:customer)
  end


  end
