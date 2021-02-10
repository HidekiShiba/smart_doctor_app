class Reservation < ApplicationRecord
  belongs_to :patient
  has_one :examination, dependent: :destroy

  enum examination_count: {初診: 0, 複数回: 1}
  enum treatment: {あり: 0, なし: 1}, _prefix: true
  enum side_effect: {あり: 0, なし: 1}, _prefix: true
  enum pregnancy: {なし: 0, 可能性あり: 1, 妊娠中: 2, 授乳中: 3}, _prefix: true
  enum purpose: {処方箋のみ: 0, 診察＋処方箋: 1, 診察＋検査＋処方箋: 2}
  enum examination_status: {受診前: 0, 受診済: 1}

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :examination_count, presence: true
  validates :symptom, presence: true
  validates :body_parts, presence: true
  validates :starting_point, presence: true
  validates :treatment, presence: true
  validates :side_effect, presence: true
  validates :pregnancy, presence: true
  validates :purpose, presence: true
  validate :duplicate

  def duplicate
    start_time = self.start_time.strftime("%Y-%m-%d") + "00:00:00"
    end_time = self.start_time.strftime("%Y-%m-%d") + "23:59:59"
    if Reservation.where("patient_id = ? and start_time >= ? and start_time <= ?", self.patient_id, start_time, end_time).count() > 0
      errors.add(:start_time, "予約できる時間は１日に１回のみです")
    end
  end
end
