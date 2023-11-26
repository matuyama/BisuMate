class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  with_options presence: do
    validates :last_name
    validates :first_name
    validates :last_name_furigana
    validates :first_name_furigana
    validates :postal_code
    validates :address
    validates :telephone_number
    validates :email
  end

  def full_name
    self.last_name + "" + self.first_name
  end

  def name
    self.last_name + "" + self.first_name
  end

  def kana_full_name
    self.kana_last_name + "" + self.kana_first_name
  end

  def deliveryTarget
    "〒#{self.postal_code} #{self.address} \n#{self.full_name}"
  end

end
