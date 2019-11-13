class Pet < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :size, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :weight, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  mount_uploader :image, ImageUploader
end
