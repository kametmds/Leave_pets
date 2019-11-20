class Subphoto < ApplicationRecord
  belongs_to :space
  mount_uploader :subpicture, PictureUploader
end
