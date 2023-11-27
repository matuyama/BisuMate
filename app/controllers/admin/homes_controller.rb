class Admin::HomesController < ApplicationController

  def top
    @params = params[:customer_id]
    if @params.present?
      @orders = Order.where(customer_id: @params).page(params[:page]).per(12).order(created_at: :desc)
      @customer = Customer.find_by(id: @params)
    else
      @orders = Order.page(params[:page]).per(12).order(created_at: :desc)
    end
    @total_amount = 0
  end

end
