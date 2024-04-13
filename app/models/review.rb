class Review < ApplicationRecord
  
  has_many :review_comments
  
  
  belongs_to :user
  belongs_to :shop
 
end
