class Admin::ItemsController < ApplicationController


  def index
    @items = Item.all
    @item =Item.all.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    item = item.new(list_params)
    item.save
    redirect_to '/top'
  end

  def show
  end

  def edit
  end

  def update
  end


  private

  def item_params
    params.require(:item).permit(:title, :body, :image, :page)
  end



end
