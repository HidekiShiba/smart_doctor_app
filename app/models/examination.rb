class Examination < ApplicationRecord
  belongs_to :reservation, optional: true
  belongs_to :reception, optional: true
  
  enum prescription_status: {あり: 0, なし: 1}
  enum update_status: {入力前: 0, 入力済: 1}
end