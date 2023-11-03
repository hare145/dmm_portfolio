class Soft < ApplicationRecord
  
  validates :company, presence: true
  validates :address, presence: true
  validates :introduction, presence: true
  
  has_many :softmarks, dependent: :destroy
  has_many :softcomments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :work
  
  has_one_attached :logo_image
  
  # ---Impressionistを用いてPV数取得---
  is_impressionable counter_cache: true
  
  

  scope :public_true, -> { where(is_public: true) }
  scope :public_false, -> { where(is_public: false) }
  scope :new_search, -> { order(created_at: :desc) }
  scope :old_search, -> { order(created_at: :asc) }
  scope :view_many_search, -> { order(impressions_count: :desc) }
  scope :view_few_search, -> { order(impressions_count: :asc) }
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

