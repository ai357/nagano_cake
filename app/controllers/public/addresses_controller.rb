class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(addresses_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
    #@address.save
    #redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(addresses_params)
    if @address.save
      redirect_to addresses_path
    else
      render :edit
    end
  end
  
  def delete
    @address = Address.find(params[:id])
    @address.destroy(addresses_params)
    if @address.save
      redirect_to addresses_path
    else
      render :edit
    end
    
    
  private
  def addresses
    params.require(:addresses).permit(:customer_id, :postal_code, :address, :name)
  end

end
