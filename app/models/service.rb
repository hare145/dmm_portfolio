class Service < ApplicationRecord
  
  validates :content, uniqueness: true
  
  has_many :user_services
  
end
