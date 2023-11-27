class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(12)
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

  def edit
    @item = Item.find(params[:id])
  end

  def add_stock
    item = Item.find(params[:item_id])
    item.stock += params[:item][:add_stock].to_i
    if item.update(stock: item.stock)
      redirect_to edit_admin_item_path(item)
    else
      flash[:notice] = "保存に失敗しました"
      redirect_to edit_admin_item_path(item)
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to admin_item_path(item)
    else
      flash[:notice] = "保存に失敗しました"
      redirect_to edit_admin_item_path(item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :description, :size_sutra, :size_length, :price_tax_excluded, :stock, :is_on_sale, :item_image)
  end

end
