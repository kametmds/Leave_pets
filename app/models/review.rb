class Review < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :title, presence: true, length: { maximum: 30 }
  validates :comment, presence: true, length: { maximum: 150 }
  validates :rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, :less_than_or_equal_to => 5 }
end
