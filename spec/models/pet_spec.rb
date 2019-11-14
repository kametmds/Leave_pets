require 'rails_helper'
# bin/rspec spec/models/pet_spec.rb
RSpec.describe Pet, type: :model do
  it "nameが空ならバリデーションが通らない" do
    pet = Pet.new(name: '', age: '1', size: '1', weight: '1')
    expect(pet).not_to be_valid
  end

  it "ageが空ならバリデーションが通らない" do
    pet = Pet.new(name: 'ポチ', age: '', size: '1', weight: '1')
    expect(pet).not_to be_valid
  end

  it "name,age,size,weightに内容が記載されていればバリデーションが通る" do
    pet = Pet.new(name: 'ポチ', age: 1, size: 1, weight: 1, content: '')
    expect(pet).to be_valid
  end

  # describe "scope" do
  #   it "modelに記載したscopeによる絞りこみを確かめる" do
  #     expect(Task.title_scope("title = test")).to_not include(Task.where("title = test"))
  #   end
  # end
end
