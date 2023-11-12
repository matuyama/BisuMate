class Public::CartItemsController < ApplicationController

  def create
    item_id = params[:cart_item][:item_id]
    existing_cart_item = current_customer.cart_items.find_by(item_id: item_id)
    if existing_cart_item
      amount = params[:cart_item][:amount].to_i
      existing_cart_item.update(amount: existing_cart_item.amount + amount)
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      flash.now[:notice] = "更新に失敗しました。"
      rendre :index
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      redirect_to cart_items_path
    else
      flash.now[:destory] = "削除に失敗しました。"
      render :index
    end

  end

  def destroy_all

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end


end
