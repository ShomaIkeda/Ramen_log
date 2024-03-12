class Shop < ApplicationRecord
  
  has_many :reviews
  has_many :menus
end
