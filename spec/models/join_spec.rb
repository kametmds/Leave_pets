require 'rails_helper'
# bin/rspec spec/models/join_spec.rb
RSpec.describe Join, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
  end

  it "userが空ならバリデーションが通らない" do
    join = Join.new(user: nil, room: Room.first || room)
    expect(join).not_to be_valid
  end

  it "room_idが空ならバリデーションが通らない" do
    join = Join.new(user: User.first || user, room: nil)
    expect(join).not_to be_valid
  end

  it "room,user情報があればバリデーションが通る" do
    join = Join.new(user: User.first || user, room: Room.first || room)
    expect(join).to be_valid
  end

end
