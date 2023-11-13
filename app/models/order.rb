class Order < ApplicationRecord

  belongs_to :customer
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :order_details, dependent: :destroy
  has_many :customers, through: :addresses, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1}

end
