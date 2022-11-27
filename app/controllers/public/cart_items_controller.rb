class Public::CartItemsController < ApplicationController
  
  def show
    @cart_items = Item.find(params[:id])
  end 
  
  
  private
  def cart_items_params
    params.require(:cart_items).permit(:item)
  end  
  
end
