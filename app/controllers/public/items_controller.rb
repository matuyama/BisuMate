class Public::ItemsController < ApplicationController

  def index
    @items = Item.looks((params[:search]), (params[:word]))
    # byebug
    if @items.empty?
      flash.now[:notice] = "商品がありません。"
    end
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
