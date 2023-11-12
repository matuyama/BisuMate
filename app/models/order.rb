class Order < ApplicationRecord

  belongs_to :customer
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :order_details, dependent: :destroy
  has_many :customers, through: :addresses, dependent: :destroy

end
