class Information < ApplicationRecord
  belongs_to :theme
  has_many :favorites, dependent: :destroy
  
  attachment :image
  
  def favorited_by?(patient)
    favorites.where(patient_id: patient.id).exists?
  end
end
