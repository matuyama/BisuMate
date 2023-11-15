class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_one_attached :item_image

  enum is_on_sale: { on_sale:true, sales_stop: false}

  def price_tax_including
    (self.price_tax_excluded * 1.1).floor
  end

end
