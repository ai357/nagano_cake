class Public::ItemsController < ApplicationController
  
  # 商品一覧
  def index
    # @genreでGenreモデルのデータすべてを引き出す
    @genre = Genre.all
    # @itemでItemモデルのデータすべてをページ付きで表示（kaminari ページネーション）
    @item =Item.all.page(params[:page])
  end
  
  # 商品
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
