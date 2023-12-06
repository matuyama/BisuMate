class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(12)
  end

  def new
    @item = Item.new
  end

  def create
    genre_names = params[:item].delete(:genre_names).split(',')
    item = Item.new(item_params)
    if item_params[:item_image].present?
      labels = Vision.get_image_data(item_params[:item_image])
      japanese_labels = Translation.translate_to_japanese(labels)
      genre_names += japanese_labels
    end
    genre_names.uniq!
    if item.save
      item.save_genres(genre_names)
      redirect_to admin_item_path(item)
    else
      flash[:notice] = "保存に失敗しました"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = @item.genres.pluck(:name).join(',')
  end

  def edit
    @item = Item.find(params[:id])
    @genres = @item.genres.pluck(:name).join(',')
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
      genres = params[:item][:genre_name].split(',')
      item.update_genres(genres)
      redirect_to admin_item_path(item)
    else
      flash[:notice] = "保存に失敗しました"
      redirect_to edit_admin_item_path(item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :size_sutra, :size_length, :price_tax_excluded, :stock, :is_on_sale, :item_image)
  end

end
