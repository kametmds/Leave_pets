require 'rails_helper'
# bin/rspec spec/models/message_spec.rb
RSpec.describe Message, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
  end

  it "bodyが空ならバリデーションが通らない" do
    message = Message.new(body: '', user: User.first || user, room: Room.first || room)
    expect(message).not_to be_valid
  end

  it "room_idが空ならバリデーションが通らない" do
    message = Message.new(body: "おはよう", user: User.first || user, room: nil)
    expect(message).not_to be_valid
  end

  it "body,room,user情報があればバリデーションが通る" do
    message = Message.new(body: "おはよう", user: User.first || user, room: Room.first || room)
    expect(message).to be_valid
  end

end
