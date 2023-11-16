class Admin::OrderDetailsController < ApplicationController

  def update
    order_detail = OrderDetail.find(params[:order_id])
    order_details = OrderDetail.where(order_id: order_detail.order_id)
    # byebug
    if params[:order_detail][:status] == "in_production"
      order_detail.order.update(status: 2)
    end
    order_detail.update(order_detail_params)
    if order_details.all?{|detail| detail.status == "production_complete"}
      order_detail.order.update(status: 3)
    end
    redirect_to admin_order_path
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:status)
  end

end
