class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @order = Order.new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order_payment_method = params[:order][:payment_method].to_i
    @order_postage = 800
    @total_price = 0
    selected_address = params[:order][:selected_address].to_i
    if selected_address == 0
      @order_info = Customer.find(current_customer.id)
      @deliveryTarget = @order_info.deliveryTarget
    elsif selected_address == 1
      @order_info = Address.find(params[:order][:address_id])
      @deliveryTarget = @order_info.deliveryTarget
    elsif selected_address == 2
      @order_info = params[:order]
      @deliveryTarget = @order_info.deliveryTarget
    else
      render :new
    end
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    if order.save
      cart_items = CartItem.where(customer_id: current_customer.id)
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = order.id
        order_detail.item_id = cart_item.item.id
        order_detail.amount = cart_item.amount
        order_detail.price_tax_included = cart_item.item.price_tax_including
        if order_detail.save
          cart_items.destroy_all
        end
      end
      redirect_to thanks_orders_path
    else
      flash.now[:notice] = "注文処理に失敗しました。"
      render :new
    end
  end

  def thanks

  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])

  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :billing_price, :payment_method, :postage, :postal_code, :address, :status)
  end

end
