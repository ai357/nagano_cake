class Public::OrdersController < ApplicationController

  def new
      @order = Order.new
  end


  def confirm
      @cart_items = current_customer.cart_items
      @total = 0

      if params[:order][:address_number] == "1"
        @order = Order.new(order_params)
        @order.shipping_cost = 800
        @order.address = current_customer.address
        @order.postal_code = current_customer.postal_code
        @order.name = current_customer.last_name + current_customer.first_name
      elsif params[:order][:address_number] == "2"
        @order = Order.new(order_params)
        @order.shipping_cost = 800
        @address = Address.find(params[:order][:address_id])
        @order.address = @address.address
        @order.postal_code = @address.postal_code
        @order.name = @address.name
      elsif params[:order][:address_number] == "3"
        @order = Order.new(order_params)
        @order.shipping_cost = 800
      end
  end




    private
    def order_params
        params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
    end
end
