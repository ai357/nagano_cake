class Public::ItemsController < ApplicationController
  
  # 商品一覧
  def index
    @genre = Genre.all
    @item =Item.all.page(params[:page])
  end
  
  def show
    @item = Item.find(params[:id])
    @genre = Genre.all
    @cart_item = CartItem.new

  end  
  
  
  
  private
  
  def new_params
    params.require(:item).permit(:genre)
  end  
end
