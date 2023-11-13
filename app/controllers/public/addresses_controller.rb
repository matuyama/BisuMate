class Public::AddressesController < ApplicationController
  
  def 
    
  end

  private
  
  def address_params
    params.require(:address).permit(:customer, :name, :postal_code, :address)
  end

end
