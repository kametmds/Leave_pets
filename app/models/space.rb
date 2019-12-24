class Space < ApplicationRecord
  validates :title, presence: true
  validates :picture, presence: true
  validates :postal, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :address, presence: true
  validates :tel, presence: true,
                  numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                  format: { with: /\A\d{10}$|^\d{11}\z/ }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :user

  mount_uploader :picture, PictureUploader

  has_many :subphotos, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy, foreign_key: 'space_id'

  accepts_nested_attributes_for :subphotos, allow_destroy: true
  acts_as_taggable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.reviewest
    select('spaces.*', 'count(reviews.id) AS revs').left_joins(:reviews).group('spaces.id').order('revs desc')
  end
end
