class Information < ApplicationRecord
  belongs_to :theme
  has_many :favorites, dependent: :destroy
  
  attachment :image
  
  validates :subject, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 400 }
  
  def favorited_by?(patient)
    favorites.where(patient_id: patient.id).exists?
  end
end
