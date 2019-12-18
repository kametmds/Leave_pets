class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :space

  enum status: { 予約内容確認中: 0, 予約完了: 1, 引取り済: 2}

  validates :start_date, presence: true
  validates :end_date, presence: true

  has_many :reservation_pets, dependent: :destroy
  has_many :pets, through: :reservation_pets
end
