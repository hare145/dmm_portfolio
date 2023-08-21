class Soft < ApplicationRecord
  
  has_many :softmarks, dependent: :destroy
  has_many :softcomments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :work
  
  has_one_attached :logo_image
  
  # ---Impressionistを用いてPV数取得---
  is_impressionable counter_cache: true
  
  

  scope :public_true, -> { where(is_public: true) }
  scope :create_search, -> { order(created_at: :desc) }
  scope :view_search, -> { order(impressions_count: :desc) }
  scope :company_search, -> (company) do
    where("company LIKE?","%#{company}%")
  end
  scope :work_search, -> (work) do
    where(work_id: work)
  end

  
  def get_logo_image(width, height)
    unless logo_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      logo_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    logo_image.variant(resize_to_limit: [width, height]).processed
  end
  
  
  def save_notification!(current_user, soft_id)
    notification = current_user.notifications.new(
      soft_id: id,
    )
    notification.save
  end
  
  
end
