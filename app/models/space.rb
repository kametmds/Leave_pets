class Space < ApplicationRecord
  validates :title, presence: true
  validates :picture, presence: true
  validates :postal, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :address, presence: true
  validates :tel, presence: true,
                  numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                  format: { with: /\A\d{10}$|^\d{11}\z/ }
  validates :capacity, presence: true

  belongs_to :user

  mount_uploader :picture, PictureUploader

  has_many :subphotos, dependent: :destroy
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :subphotos, allow_destroy: true
  acts_as_taggable
end
