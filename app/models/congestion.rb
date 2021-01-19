class Congestion < ApplicationRecord
  has_many :receptions, dependent: :destroy
end
