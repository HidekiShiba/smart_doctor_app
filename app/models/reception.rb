class Reception < ApplicationRecord
  belongs_to :patient
  belongs_to :congestion
  has_one :examination, dependent: :destroy
  
  enum examination_status: {発行済: 0, 受診済: 1}
  
  def self.looks(searches, words)
    if searches == "perfect_match"
      @reception = Reception.where("id LIKE ?", "#{words}").or(where("last_name_kana LIKE ?", "#{words}"))
    elsif searches == "partial_match"
      @reception = Reception.where("id LIKE ?", "%#{words}%").or(where("last_name_kana LIKE ?", "%#{words}%"))
    elsif searches == "forward_match"
      @reception = Reception.where("id LIKE ?", "#{words}%").or(where("last_name_kana LIKE ?", "#{words}%"))
    else
      @reception = Reception.where("id LIKE ?", "%#{words}").or(where("last_name_kana LIKE ?", "%#{words}"))
    end
  end
end
