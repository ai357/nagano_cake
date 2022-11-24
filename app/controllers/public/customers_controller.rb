class Public::CustomersController < ApplicationController


  def show
    @customer = current_customer
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

  def edit
    @customer = current_customer
  end

  def create
  end

  def unsubscribe
    @customer = current_customer
    
  end  



  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end


  end
