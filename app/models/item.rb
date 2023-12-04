class Item < ApplicationRecord

    with_options presence: do
    validates :name
    validates :description
    validates :size_sutra
    validates :size_length
    validates :price_tax_excluded
    validates :stock
    validates :is_on_sale
  end

  has_many :genre_relations, dependent: :destroy
  has_many :genres, through: :genre_relations
  has_many :cart_items, dependent: :destroy
  has_one_attached :item_image

  enum is_on_sale: { on_sale:true, sales_stop: false}


  # タグ付けの新規投稿用メソッド
  def save_genres(genre_names)
    genre_names.each do |new_genres|
      self.genres.find_or_create_by(name: new_genres)
    end
  end

  # タグ付けの更新用メソッド
  def update_genres(latest_genres)
    if self.genres.empty?
      latest_genres.each do |latest_genre|
        self.genres.find_or_create_by(name: latest_genre)
      end
    elsif latest_genres.empty?
      self.genres.each do |genre|
        self.genres.delete(genre)
      end
    else
      current_genres = self.genres.pluck(:name)
      old_genres = current_genres - latest_genres
      new_genres = latest_genres - current_genres

      old_genres.each do |old_genre|
        genre = self.genres.find_by(name: old_genre)
        self.genres.delete(genre) if genre.present?
      end

      new_genres.each do |new_genre|
        self.genres.find_or_create_by(name: new_genre)
      end
    end
  end

  # フィルターでの分岐
  def self.filtering(genre_id, select, item)
    if genre_id.present? && select.present?
      if select == "size_sutra"
        joins(:genres).where(genres: { id: genre_id }, size_sutra: item.size_sutra)
      elsif select == "size_length"
        joins(:genres).where(genres: { id: genre_id }, size_length: item.size_length)
      end
    else
      joins(:genres).where(genres: { id: item.genres }, size_sutra: item.size_sutra)
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
