class Review < ApplicationRecord
  
  has_many :review_comments
  
  
  belongs_to :user
  belongs_to :shop
  
  validates :title, presence: true
  validates :eated_menu, presence: true
  validates :comment, presence: true, length:{maximum:1000}
  validates :star, presence: true
 
end
