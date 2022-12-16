class Admin::OrdersController < ApplicationController

  def show
      @customer = Customer.find(params[:id])
      #byebug
      #@order_detail = OrderDetail.find(params[:id])
      @order = Order.find(params[:id])
  end

  def update
      @order = Order.find(params[:id])
      @order_detail = OrderDetail.find(params[:id])
      @order_details = @order.order_details.all
      if @order.update(order_params)
        @order_details.update_all(making_status: 1) if @order.status == "confirm"
      end
      redirect_to admin_order_path(@order)
  end



private

  def order_params
    params.require(:order).permit( :customer_id, :status)
  end

  def order_detail_params
    params.require(:order_detail).permit( :amount, :status, :price )
  end

end
