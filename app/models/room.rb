class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :members, class_name: "User", through: :joins, source: :user
end
