class Public::ItemsController < ApplicationController
  def index
    @genres=Genre.all
    if params[:genre_id]
     @genre=Genre.find(params[:genre_id])
     @items=@genre.items.page(params[:page])
    else
     @items=Item.all.page(params[:page])
    end
    @item=@items.count
  end
  
  def show
    @genres=Genre.all
    @item=Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
