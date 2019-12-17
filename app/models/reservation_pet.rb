class ReservationPet < ApplicationRecord
  belongs_to :reservation
  belongs_to :pet
  validates :reservation_id, presence: true
  validates :pet_id, presence: true
end
