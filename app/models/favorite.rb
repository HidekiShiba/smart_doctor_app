class Favorite < ApplicationRecord
  belongs_to :patient
  belongs_to :information
end
