class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @order_details_page = Order_detail.all.page(params[:page])
  end
  
  
  private
  
  def order_details_params
    params.require(:order_detail).permit(:name, :created_at, :amount, :making_status)
  end


end

