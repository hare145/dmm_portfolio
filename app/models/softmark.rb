class Softmark < ApplicationRecord
  belongs_to :user
  belongs_to :soft
  
  validates :user_id, uniqueness: { scope: :soft_id }
end
