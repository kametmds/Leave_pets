class Pet < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :size, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :weight, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user
  mount_uploader :image, ImageUploader

  has_many :reservation_pets, dependent: :destroy
  has_many :reservations, through: :reservation_pets
end
