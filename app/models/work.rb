class Work < ApplicationRecord
  has_many :softs, dependent: :destroy
end
