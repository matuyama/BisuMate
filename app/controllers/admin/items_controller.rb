class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_item_path(item)
    else
      flash[:notice] = "保存に失敗しました"
      redirect_to new_admin_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :description, :size_sutra, :size_length, :price_tax_excluded, :is_on_sale)
  end

end
