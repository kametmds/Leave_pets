require 'rails_helper'
# bin/rspec spec/models/reservation_spec.rb
RSpec.describe Reservation, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @pet = FactoryBot.create(:pet)
    @space = FactoryBot.create(:space)
  end

  it "pet_idsが空ならバリデーションが通らない" do
    reservation = Reservation.new(status: 0, start_date: Date.today, end_date: Date.today + 1, pet_ids: [] )
    expect(reservation).not_to be_valid
  end

  it "start_dateが空ならバリデーションが通らない" do
    reservation = Reservation.new(status: 0, start_date: Date.today, end_date: '', pet_ids: [Pet.last.id] )
    expect(reservation).not_to be_valid
  end

  it "start&end_date,status,space,pet,user情報があればバリデーションが通る" do
    reservation = Reservation.new(status: 0, start_date: Date.today, end_date: Date.today + 1, pet_ids: [Pet.last.id],
                                  user: User.first || user, space: Space.first || space)
    expect(reservation).to be_valid
  end

end
