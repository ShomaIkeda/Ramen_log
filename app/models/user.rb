class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :reviews, dependent: :destroy
         has_many :review_comments, dependent: :destroy
         
         
  validates :email, presence: true
  validates :nickname, presence: true
end
