class Address < ApplicationRecord

  belongs_to :customer

  def deliveryTarget
    "〒#{self.postal_code} #{self.address} #{self.name}"
  end

  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/

  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :address, presence: true
  validates :name, presence: true

end
