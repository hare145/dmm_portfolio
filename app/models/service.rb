class Service < ApplicationRecord
  
  has_many :userservices, dependent: :destroy
  
end
