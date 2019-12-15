class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  # accepts_nested_attributes_for :pet
  belongs_to :space
  # accepts_nested_attributes_for :space
  enum status: { ホストによる予約確認中: 0, 予約完了: 1, 引取り済: 2}
end
