class Admin::OrdersController < ApplicationController

  # 注文詳細ページ
  def show
      #byebug
      #@order_detail = OrderDetail.find(params[:id])
      @order = Order.find(params[:id])
      @customer = @order.customer
  end

  # 注文更新
  def update
      # Orderモデルからidでデータを見つける
      @order = Order.find(params[:id])
      # OrderDtailのidカラムでデータを見つける（OrderとOrderDtailはアソシエーションで繋がってるからorderコントローラーで使用できる）
      @order_detail = OrderDetail.find(params[:id])
      # Order_detailsカラムのすべてのデータを出す
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
