require 'rails_helper'
# bin/rspec spec/models/review_spec.rb
RSpec.describe Review, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @space = FactoryBot.create(:space)
  end

  it "commentが空ならバリデーションが通らない" do
    review = Review.new(comment: '', rate: 1 ,user: User.first, space: Space.first)
    expect(review).not_to be_valid
  end

  it "rateが空ならバリデーションが通らない" do
    review = Review.new(comment: 'test', rate: nil ,user: User.first, space: Space.first)
    expect(review).not_to be_valid
  end

  it "rateが5より大きいならバリデーションが通らない" do
    review = Review.new(comment: 'test', rate: 6 ,user: User.first, space: Space.first)
    expect(review).not_to be_valid
  end

  it "userが空ならバリデーションが通らない" do
    review = Review.new(comment: 'test', rate: 5 ,user: nil, space: Space.first)
    expect(review).not_to be_valid
  end

  it "user,rate,comment,space情報があればバリデーションが通る" do
    review = Review.new(comment: 'test', rate: 1 ,user: User.first, space: Space.first)
    expect(review).to be_valid
  end

end
