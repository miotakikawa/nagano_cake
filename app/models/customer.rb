class Customer < ApplicationRecord
  has_many :cart_items
  has_many :orders
  has_many :addresses 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :first_name, presence: true
  validates :last_name, presence: true  
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true       
  validates :email, presence: true
  validates :postal_code, presence: true       
  validates :address, presence: true
  validates :telephone_number, presence: true  
  #validates :password, presence: true  
 def full_address
    '〒' + postal_code + ' ' + address + ' ' + last_name + first_name
 end
 
 def name
    last_name + first_name
 end
 
 def name_kana
    last_name_kana + first_name_kana
 end
end
