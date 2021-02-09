class Reception < ApplicationRecord
  belongs_to :patient
  belongs_to :congestion
  has_one :examination, dependent: :destroy

  enum examination_status: {発行済: 0, 受診済: 1}

  validates :number, presence: true
  validates :start_time, presence: true
  validate :duplicate

  def duplicate
    start_time = self.start_time.strftime("%Y-%m-%d") + " 00:00:00"
    end_time = self.start_time.strftime("%Y-%m-%d") + "23:59:59"
    if Reception.where("patient_id = ? and start_time >= ? and start_time <= ?", self.patient_id, start_time, end_time).count() > 0
      errors.add(:start_time, "本日分の当日受付はすでに発行済です")
    end
  end
end
