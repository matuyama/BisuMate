class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_one_attached :item_image

  def price_tax_including
    (self.price_tax_excluded * 1.1).floor
  end

end
