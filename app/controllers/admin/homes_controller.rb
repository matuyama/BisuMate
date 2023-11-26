class Admin::HomesController < ApplicationController

  def top
    @orders = Order.page(params[:page]).per(12)
    @total_amount = 0
  end

end
