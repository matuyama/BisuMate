class Public::ItemsController < ApplicationController

  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @items = Item.looks((params[:search]), (params[:word])).page(params[:page]).per(8)
    @genre_ids = params[:genre_ids]&.select(&:present?)
    if @genre_ids.present?
      @genre_name = "名前: "
      @genre_ids.each do |id|
        @genre_name = @genre_name + ' ' + Genre.find(id).name if id != ""
      end
      @items = @items.joins(:genre_relations).where(genre_relations: {genre_id: @genre_ids}).group("items.id").having("count(*) = #{@genre_ids.length}")
    end

  end

  def show
    @item = Item.find(params[:id])
    # byebug
    # @itemFiltering = Item.find(params[:id])
    @items = Item.filtering(params[:genre_id], params[:select], @item).page(params[:page]).per(4)
    @cart_item = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :description, :size_sutra, :size_length, :price_tax_excluded, :is_on_sale, :item_image)
  end

end
