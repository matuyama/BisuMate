class Genre < ApplicationRecord

  has_many :genre_relations, dependent: :destroy
  has_many :items, through: :tag_relationships

  validates :name, uniqueness: true, presence: true

end
