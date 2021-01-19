class Theme < ApplicationRecord
  has_many :informations, dependent: :destroy
end
