class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  # accepts_nested_attributes_for :pet
  belongs_to :space
  # accepts_nested_attributes_for :space
  enum priority: { 未予約: 0, 予約中: 1, 予約完了: 2, 引取り済: 3}
end
