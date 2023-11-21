class Address < ApplicationRecord
  
  belongs_to :customer

  def deliveryTarget
    "〒#{self.postal_code} #{self.address} #{self.name}"
  end

end
