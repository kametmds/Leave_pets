require 'rails_helper'
# bin/rspec spec/models/room_spec.rb
RSpec.describe Room, type: :model do
  it "いてくれるだけでいい" do
    room = Room.new
    expect(room).to be_valid
  end
end

