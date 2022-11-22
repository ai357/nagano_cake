class Public::ItemsController < ApplicationController
  
  def index
    @genre = Genre.all
    @item = item.all
    @item =Item.all.page(params[:page])
  end
  
  
  
  private
  
  def new_params
    params.require(:item).permit(:genre)
  end  
end
