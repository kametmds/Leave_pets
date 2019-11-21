class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 30 }

  has_many :pets, dependent: :destroy
  has_many :spaces, dependent: :destroy

  mount_uploader :icon, IconUploader
end
