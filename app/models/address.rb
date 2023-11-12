class Address < ApplicationRecord

  def deliveryTarget
    "〒#{self.postal_code} #{self.address} #{self.name}"
  end

end
