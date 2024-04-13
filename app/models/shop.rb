class Shop < ApplicationRecord
  
  has_many :reviews
  has_many :menus
  
  validates :shop_name, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :opening_time, presence: true
  validates :holiday, presence: true
  
   
  
 
end
