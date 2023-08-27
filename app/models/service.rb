class Service < ApplicationRecord
  
  has_many :userservices, dependent: :destroy
  
  scope :content_search, -> (content) do
    where("content LIKE?","%#{content}%")
  end
  
end
