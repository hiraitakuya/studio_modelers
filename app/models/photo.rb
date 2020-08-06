class Photo < ApplicationRecord
  belongs_to :product, optional: true
  validates :image_url, presence: true
  mount_uploader :image_url, ImageUploader
end
