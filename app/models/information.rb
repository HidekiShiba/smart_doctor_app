class Information < ApplicationRecord
  belongs_to :theme
  has_many :favorites, dependent: :destroy
  
  attachment :image
  
  def favorited_by?(patient)
    favorites.where(patient_id: patient.id).exists?
  end
  
  def self.looks(searches, words)
    if searches == "perfect_match"
      @information = Information.where("subject LIKE ?", "#{words}")
    elsif searches == "partial_match"
      @information = Information.where("subject LIKE ?", "%#{words}%")
    elsif searches == "forward_match"
      @information = Information.where("subject LIKE ?", "#{words}%")
    else
      @information = Information.where("subject LIKE ?", "%#{words}")
    end
  end
end
