class ReservationPet < ApplicationRecord
  belongs_to :reservation
  belongs_to :pet
end
