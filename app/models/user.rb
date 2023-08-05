class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_services, dependent: :destroy
  has_many :softmarks, dependent: :destroy
  has_many :softmark_softs, through: :softmarks, source: :soft
  has_many :usermarks, dependent: :destroy
  has_many :usermark_softs, through: :usermarks, source: :user
  
  has_one_attached :profile_image
  
  # ---Impressionistを用いてPV数取得---
  is_impressionable counter_cache: true
  
  
  scope :creat_search, -> { order(created_at: :desc) }
  scope :view_search, -> { order(impressions_count: :desc) }
  
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
