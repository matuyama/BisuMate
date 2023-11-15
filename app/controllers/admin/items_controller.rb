class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :description, :size_sutra, :size_length, :price_tax_excluded, :is_on_sale)
  end
  
end
