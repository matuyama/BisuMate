class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

   VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/

   validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }

  with_options presence: do
    validates :last_name
    validates :first_name
    validates :kana_last_name
    validates :kana_first_name
    validates :postal_code
    validates :address
    validates :phone_number
    validates :email
  end


  def name
    self.last_name + "" + self.first_name
  end

  def kana_name
    self.kana_last_name + "" + self.kana_first_name
  end

  def deliveryTarget
    "〒#{self.postal_code} #{self.address} \n#{self.name}"
  end

end
