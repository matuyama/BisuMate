class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  def subtotal
    (item.price_tax_excluded * 1.1).floor * amount
  end

end
