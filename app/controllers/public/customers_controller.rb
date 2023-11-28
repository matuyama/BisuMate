class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.find(current_customer.id)
    if customer.update(customer_params)
      redirect_to mypage_customers_path(current_customer)
    else
      flash[:notice] = "更新に失敗しました"
      redirect_to mypage_customers_path(current_customer)
    end
  end

  def unsubscribe

  end

  def quit
    customer = Customer.find(current_customer.id)
    customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :email)
  end

end
