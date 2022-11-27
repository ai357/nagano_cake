class Public::ItemsController < ApplicationController
  
  def index
    @genre = Genre.all
    @item =Item.all.page(params[:page])
  end
  
  def show
    @item = Item.find(params[:id])
    @genre = Genre.all
  end  
  
  
  
  private
  
  def new_params
    params.require(:item).permit(:genre)
  end  
end
