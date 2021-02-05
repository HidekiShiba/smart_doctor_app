class Theme < ApplicationRecord
  has_many :informations, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end
