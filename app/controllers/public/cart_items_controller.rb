class Public::CartItemsController < ApplicationController

  def show
    @cart_items = Item.find(params[:id])
  end

  def with_tax_price
      (price*1.1).floor
  end

  def index
      @cart_items = CartItem.find(cart_items_params[:id])
  end

  def update
  end

  def destroy
  end

  def destroy_all
      @destroy = current_user.cart_items.destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_items_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end


  private
  def cart_items_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
