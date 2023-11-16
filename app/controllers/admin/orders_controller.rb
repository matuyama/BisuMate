class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order.postage = 800
    @total = 0
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :billing_price, :payment_method, :postage, :postal_code, :address)
  end

end
