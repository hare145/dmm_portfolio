class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :userservices, dependent: :destroy
  has_many :userservice_services, through: :userservices, source: :service
  has_many :softmarks, dependent: :destroy
  has_many :softmark_softs, through: :softmarks, source: :soft
  has_many :usermarks, dependent: :destroy
  has_many :usermark_users, through: :usermarks, source: :user
  has_many :softcomments, dependent: :destroy
  has_many :softcomments_softs, through: :softcomments, source: :soft
  has_many :usercomments, dependent: :destroy
  has_many :usercomments_users, through: :usercommetns, source: :user
  has_many :notifications, dependent: :destroy
  has_many :contacts, dependent: :destroy
  
  has_one_attached :profile_image
  
  # ---Impressionistを用いてPV数取得---
  is_impressionable counter_cache: true
  
  enum employee: { less_than_thirty: 0, thirty_less_than_fifty: 1, fifty_less_than_hundred: 2, hundred_more: 3 }
  
  scope :create_search, -> { order(created_at: :desc) }
  scope :view_search, -> { order(impressions_count: :desc) }
  scope :many_search, -> { order(employee: :desc) }
  scope :few_search, -> { order(employee: :asc) }
  scope :private_search, -> { where(is_public: true) }
  scope :release_search, -> { where(is_public: false) }
  scope :name_search, -> (name) do
    where("name LIKE?","%#{name}%")
  end
  scope :service_search, -> (service) do
    ids = Userservice.where(service_id: service).pluck(:user_id)
    where(id: ids)
  end
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
