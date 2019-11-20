class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :pets, dependent: :destroy
  has_many :spaces, dependent: :destroy
  mount_uploader :icon, IconUploader
end
