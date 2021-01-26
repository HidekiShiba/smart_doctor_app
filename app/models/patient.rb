class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reservations, dependent: :destroy
  has_many :receptions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  enum sex: { 男性: 0, 女性: 1}
end
