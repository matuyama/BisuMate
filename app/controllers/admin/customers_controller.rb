class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postail_code, :address, :phone_numbre, :email, :is_active)
  end

end
