class Admin::CustomersController < ApplicationController

  def new
  end

  def index
    @customers = Customer.all
    @customer = @customers.all.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    if @customer.save
      redirect_to customer_path
    else
      #edit画面に留まること
      render :edit
    end
  end


 private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :page)
  end


end
