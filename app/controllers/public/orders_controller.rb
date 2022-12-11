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


  def create
      #空のカラムを用意して情報を受け取る用の記述　@order = Order.new
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.shipping_cost = 800
      @order.status = 0
      @order.save
      current_customer.cart_items.each do |cart_item|
        #一度パラメーターされたデータなのでパラメーター不要。
        order_detail = OrderDetail.new
        #order_detailテーブルの中を一つずつ埋める。（アプリ上で入力しないのでコントローラーで移す）
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.price = (cart_item.item.price*1.1).to_i
        order_detail.amount = cart_item.amount
        #enumで0
        order_detail.making_status = 0
        order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
  end


  def index
      @orders = current_customer.orders
  end


  def show

  end



    private
    def order_params
        params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
    end
end
