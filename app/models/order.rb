class Order < ApplicationRecord

  belongs_to :customer
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :order_details
  has_many :customers, through: :addresses
  has_many :order_details, dependent: :destroy

  with_options presence: do
    validates :name
    validates :billing_price
    validates :payment_method
    validates :postage
    validates :postal_code
    validates :address
    validates :status
  end

  enum payment_method: { credit_card: 0, transfer: 1}
  enum status:{ wait_for_payment: 0, payment_confirmation: 1, preparing_delivery: 2, deliveryPreparationComplete: 3, delivered: 4 }

  def deliveryTarget
    "〒#{self.postal_code} #{self.address} \n#{self.name}"
  end

end
