class Public::ItemsController < ApplicationController
  
  # 商品一覧
  def index
    # @genreでGenreモデルのデータすべてを引き出す
    @genre = Genre.all
    # @itemでItemモデルのデータすべてをページ付きで表示（kaminari ページネーション）
    @item =Item.all.page(params[:page])
  end
  
  # 商品詳細
  def show
    # ItemモデルのIDから一つ探す
    @item = Item.find(params[:id])
    # Genreモデルすべて
    @genre = Genre.all
    @cart_item = CartItem.new

  end  
  
  
  
  private
  
  def new_params
    params.require(:item).permit(:genre)
  end  
end
