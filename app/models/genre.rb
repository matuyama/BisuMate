class Genre < ApplicationRecord

  has_many :genre_relations, dependent: :destroy

  validates :name, uniqueness: true, presence: true

end
