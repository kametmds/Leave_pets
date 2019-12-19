require 'rails_helper'
# bin/rspec spec/models/reservation_pet_spec.rb
RSpec.describe ReservationPet, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @pet = FactoryBot.create(:pet)
    @pet2 = FactoryBot.create(:second_pet)
    @space = FactoryBot.create(:space)
    @reservation = FactoryBot.create(:reservation)
  end

  it "petが空ならバリデーションが通らない" do
    reservation_pet = ReservationPet.new(pet: nil, reservation: Reservation.first || reservation)
    expect(reservation_pet).not_to be_valid
  end

  it "reservationが空ならバリデーションが通らない" do
    reservation_pet = ReservationPet.new(pet: Pet.first || pet, reservation: nil)
    expect(reservation_pet).not_to be_valid
  end

  it "pet,reservation情報があればバリデーションが通る" do
    reservation_pet = ReservationPet.new(pet: Pet.first || pet, reservation: Reservation.first || reservation)
    expect(reservation_pet).to be_valid
  end

end
