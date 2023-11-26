class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum status: {start_not_possible: 0, deliveryPreparationPending: 1, preparing_delivery: 2, deliveryPreparationComplete: 3,}

  def subtotal
    self.price_tax_included * amount
  end

end
