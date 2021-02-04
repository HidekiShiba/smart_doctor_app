class Examination < ApplicationRecord
  belongs_to :reservation, optional: true
  belongs_to :reception, optional: true
  
  enum prescription_status: {あり: 0, なし: 1}
  enum update_status: {入力前: 0, 入力済: 1}
  
  def self.looks(searches, words)
    if searches == "perfect_match"
      @examination = Examination.where("id LIKE ?", "#{words}").or(where("last_name_kana LIKE ?", "#{words}"))
    elsif searches == "partial_match"
      @examination = Examination.where("id LIKE ?", "%#{words}%").or(where("last_name_kana LIKE ?", "%#{words}%"))
    elsif searches == "forward_match"
      @examination = Examination.where("id LIKE ?", "#{words}%").or(where("last_name_kana LIKE ?", "#{words}%"))
    else
      @examination = Examination.where("id LIKE ?", "%#{words}").or(where("last_name_kana LIKE ?", "%#{words}"))
    end
  end
end
