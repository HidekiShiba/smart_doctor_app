class Information < ApplicationRecord
  belongs_to :theme
  
  attachment :image
end
