class Soft < ApplicationRecord
  
  has_one_attached :logo_image
  
  # ---Impressionistを用いてPV数取得---
  is_impressionable counter_cache: true
  
  
  def get_logo_image(width, height)
    unless logo_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      logo_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    logo_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # ---ソフトの公開情報---
  scope :public_true, -> { where(is_public: true) }
  
  scope :creat_search, -> { order(created_at: :desc) }
  scope :view_search, -> { order(impressions_count: :desc) }

  # scope :m_removal, -> { gsub(/["/, '') }  
  # scope :b_removal, -> { gsub(/"]/, '')}
end
