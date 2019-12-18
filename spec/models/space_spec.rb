require 'rails_helper'
# bin/rspec spec/models/space_spec.rb
RSpec.describe Space, type: :model do
  it "titleが空ならバリデーション通らない" do
    space = Space.new(title: '1', postal: '111-1111', address: '1', tel: '11111111111', capacity: '1',
                      picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/noimage2.jpg')))
    expect(space).not_to be_valid
  end

  it "画像が空ならバリデーション通らない" do
    space = Space.new(title: '1', postal: '111-1111', address: '1', tel: '11111111111', capacity: '1')
    expect(space).not_to be_valid
  end

  it "content以外に内容が記載されていればバリデーション通る" do
    user = User.new(name: '成功テスト', email: 'success@s.com', password: '111111')
    space = Space.new(title: '1', postal: '111-1111', address: '1', tel: '11111111111', capacity: '1', user: User.first || user,
                      picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/noimage2.jpg')))
    expect(space).to be_valid
  end

end
