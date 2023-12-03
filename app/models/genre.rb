class Genre < ApplicationRecord

  has_many :genre_relations, dependent: :destroy
  has_many :items, through: :genre_relations

  validates :name, uniqueness: true, presence: true

end
