class Public::HomesController < ApplicationController

  def top
    @item = Item.all
    @item = @item.last(4)
    @genre = Genre.all
    # byebug
  end

  def about
  end


end
