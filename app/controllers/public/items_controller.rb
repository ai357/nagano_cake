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
    # CartItemカラムに新たなにデータを入れる枠を作る
    @cart_item = CartItem.new

  end  
  
  
  
  private
  
  # https://qiita.com/morikuma709/items/2dc20d922409ae7ce216
  # 参考資料。require：データのオブジェクト名　permit:保存ができる
  def new_params
    params.require(:item).permit(:genre)
  end  
end
