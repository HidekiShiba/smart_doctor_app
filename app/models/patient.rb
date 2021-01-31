class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reservations, dependent: :destroy
  has_many :receptions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  enum sex: { 男性: 0, 女性: 1}
  
  def active_for_authentication?
    super && (self.is_unsubscribe_flag == false)
  end
  
  def self.looks(searches, words)
    if searches == "perfect_match"
      @patient = Patient.where("id LIKE ?", "#{words}").or(where("last_name_kana LIKE ?", "#{words}"))
    elsif searches == "partial_match"
      @patient = Patient.where("id LIKE ?", "%#{words}%").or(where("last_name_kana LIKE ?", "%#{words}%"))
    elsif searches == "forward_match"
      @patient = Patient.where("id LIKE ?", "#{words}%").or(where("last_name_kana LIKE ?", "#{words}%"))
    else
      @patient = Patient.where("id LIKE ?", "%#{words}").or(where("last_name_kana LIKE ?", "%#{words}"))
    end
  end
end
