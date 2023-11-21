class Public::AddressesController < ApplicationController

  before_action :access_limit, only: [:edit, :update, :destroy]

  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      flash.now[:notice] = "登録に失敗しました"
      redirect_to addresses_path
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      redirect_to addresses_path
    else
      flash.new[:notice] = "更新に失敗しました"
    end
  end

  def destroy
    address = Address.find(params[:id])
    if address.destroy
      redirect_to addresses_path
    else
      flash.now[:notice] = "削除に失敗しました。"
      render :index
    end
  end

  private

  def address_params
    params.require(:address).permit(:customer, :name, :postal_code, :address)
  end

  def access_limit
    address = Address.find(params[:id])
    unless address.customer_id == current_customer.id
      redirect_to addresses_path
    end
  end

end
