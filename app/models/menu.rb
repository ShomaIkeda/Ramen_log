class Menu < ApplicationRecord
  
  belongs_to :shop
  belongs_to :genre
  
  validates :name, presence: true
  
  scope :where_genre_active, -> { joins(:genre).where(genres: { is_active: true }) }
  
  
end
