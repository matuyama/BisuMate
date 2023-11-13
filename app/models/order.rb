class Order < ApplicationRecord

  belongs_to :customer
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :order_details
  has_many :customers, through: :addresses
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1}

  def deliveryTarget
    "〒#{self.postal_code} #{self.address} \n#{self.name}"
  end

end
