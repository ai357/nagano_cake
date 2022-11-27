class Admin::ItemsController < ApplicationController


  def index
    @items = Item.all
    #ページネーション用。部分テンプレートじゃないときはallいる。
    @item =Item.all.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    # ()の中にはidに入れたい変数が入る
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = current_admin
    @item.update(item_params)
    if @item.save
      redirect_to admin_item_path
    else
      #edit画面に留まること
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
  end



end
