class Softcomment < ApplicationRecord
  validates :content, presence: true
  
  belongs_to :user
  belongs_to :soft
end
