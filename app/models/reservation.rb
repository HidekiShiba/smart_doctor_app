class Reservation < ApplicationRecord
  belongs_to :patient
  has_one :examination, dependent: :destroy
  
  enum examination_count: {初診: 0, 複数回: 1}
  enum treatment: {あり: 0, なし: 1}, _prefix: true
  enum side_effect: {あり: 0, なし: 1}, _prefix: true
  enum pregnancy: {なし: 0, 可能性あり: 1, 妊娠中: 2, 授乳中: 3}, _prefix: true
  enum purpose: {処方箋のみ: 0, 診察＋処方箋: 1, 診察＋検査＋処方箋: 2}
  enum examination_status: {受診前: 0, 受診済: 1}
  
  # scope :between, lambda {|start_time, end_time| {:conditions => ["? < starts_at and starts_at < ?", Event.format_date(start_time), Event.format_date(end_time)] }}
  def self.looks(searches, words)
    if searches == "perfect_match"
      @reservation = Reservation.where("id LIKE ?", "#{words}").or(where("last_name_kana LIKE ?", "#{words}"))
    elsif searches == "partial_match"
      @reservation = Reservation.where("id LIKE ?", "%#{words}%").or(where("last_name_kana LIKE ?", "%#{words}%"))
    elsif searches == "forward_match"
      @reservation = Reservation.where("id LIKE ?", "#{words}%").or(where("last_name_kana LIKE ?", "#{words}%"))
    else
      @reservation = Reservation.where("id LIKE ?", "%#{words}").or(where("last_name_kana LIKE ?", "%#{words}"))
    end
  end
end
