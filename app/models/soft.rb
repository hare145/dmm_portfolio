class Soft < ApplicationRecord
  
  has_one_attached :logo_image
  
  def get_logo_image(width, height)
    unless logo_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      logo_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    logo_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
