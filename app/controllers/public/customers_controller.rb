class Public::CustomersController < ApplicationController

  def customer
    @customer = Customer.new
  end

end
