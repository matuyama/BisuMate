class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :billing_price, :payment_method, :posage, :postal_code, :address, :status)
  end

end
