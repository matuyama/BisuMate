class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum status: {start_not_possible: 0, production_pending: 1, in_production: 2, production_complete: 3,}

  def subtotal
    self.price_tax_included * amount
  end

end
