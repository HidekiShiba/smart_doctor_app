class Reception < ApplicationRecord
  belongs_to :patient
  has_one :examination, dependent: :destroy
  
  enum examination_status: {発行済: 0, 受診済: 1}
end
