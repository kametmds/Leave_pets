class Talk < ApplicationRecord
  has_many :joins, dependent: :destroy
  has_many :members, class_name: "User", through: :joins, source: :user
  has_many :messages, dependent: :destroy
end
