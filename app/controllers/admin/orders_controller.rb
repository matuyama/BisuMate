class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order.postage = 800
    @total = 0
  end

  def update
    order = Order.find(params[:id])
    if params[:order][:status] == "payment_confirmation"
      order.order_details.each do |order_detail|
        order_detail.update(status: 1)
      end
    end
    if order.update(order_params)
      redirect_to admin_order_path(order)
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :billing_price, :payment_method, :postage, :postal_code, :address, :status)
  end

end
