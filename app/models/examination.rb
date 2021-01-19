class Examination < ApplicationRecord
  belongs_to :reservation
  belongs_to :reception
  
  enum prescription_status: {あり: 0, なし: 1}
end
