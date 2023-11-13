class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def subtotal
    self.price_tax_included * amount
  end

end
