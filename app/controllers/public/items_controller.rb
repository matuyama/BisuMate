class Public::ItemsController < ApplicationController

  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @items = Item.looks((params[:search]), (params[:word])).page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @itemFiltering = Item.find(params[:id])
    @items = Item.filtering(params[:genre_id], params[:select], @item).page(params[:page]).per(5)
    @cart_item = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :description, :size_sutra, :size_length, :price_tax_excluded, :is_on_sale, :item_image)
  end

end
