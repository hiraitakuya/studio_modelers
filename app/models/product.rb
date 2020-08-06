class Product < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :user_id, presence: true

  belongs_to :user
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true
end
