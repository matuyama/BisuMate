class Item < ApplicationRecord

    with_options presence: do
    validates :genre_id
    validates :name
    validates :description
    validates :size_sutra
    validates :size_length
    validates :price_tax_excluded
    validates :stock
    validates :is_on_sale
  end

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_one_attached :item_image

  enum is_on_sale: { on_sale:true, sales_stop: false}

  # フィルターでの分岐
  def self.filtering(genre_id, select, item)
    if genre_id.present? && select.present?
      if select == "size_sutra"
        where(genre_id: genre_id, size_sutra: item.size_sutra)
      elsif select == "size_length"
        where(genre_id: genre_id, size_length: item.size_length)
      end
    else
      where(genre_id: item.genre.id, size_sutra: item.size_sutra)
    end
  end

  # indexでの検索分岐
  def self.looks(search, word)
    if search == "word_match"
      where("name LIKE?","%#{word}%")
    elsif search == "genre_match"
      where(genre_id: word)
    else
      all
    end
  end

  # 画像リサイズ
  def get_item_image(width,height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_fill: [width, height]).processed
  end

  def price_tax_including
    (self.price_tax_excluded * 1.1).floor
  end
end
