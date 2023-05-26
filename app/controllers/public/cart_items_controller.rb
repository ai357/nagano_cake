class Public::CartItemsController < ApplicationController

  def show
    @cart_items = Item.find(params[:id])
  end

  def with_tax_price
      (price*1.1).floor
  end

  def index
      @cart_items = current_customer.cart_items.all
      @total = 0
  end

  def update
    # 1. params[:id]を使って変更をかけたいカートをfindで見つける
    # 変数 = Model.find(params[:id])
    @cart_item = CartItem.find(params[:id])
    # 2. 1で見つけたレコードに対してupdateを行う
    # 変数.update(変更をしたいカラム名: 変更をかけたい値)
    @cart_item.update(cart_items_params)
    redirect_to cart_items_path(@cart_item.id)
  end

  # 1件のみ削除
  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end

  # 買い物カゴをすべて削除
  def destroy_all
      @destroy = current_customer.cart_items.destroy_all
      redirect_to cart_items_path
  end

  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_items_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to cart_items_path
    end
  end


  private
  def cart_items_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

#require 'active_support/core_ext/numeric/conversions'

end
