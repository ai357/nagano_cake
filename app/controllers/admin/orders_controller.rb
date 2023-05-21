class Admin::OrdersController < ApplicationController

  # 注文
  def show
      #byebug
      #@order_detail = OrderDetail.find(params[:id])
      @order = Order.find(params[:id])
      @customer = @order.customer
  end

  def update
      @order = Order.find(params[:id])
      @order_detail = OrderDetail.find(params[:id])
      @order_details = @order.order_details.all
      if @order.update(order_params)
        if @order.status == "confirm"
          @order_details.update_all(making_status: 1) 
        end
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
