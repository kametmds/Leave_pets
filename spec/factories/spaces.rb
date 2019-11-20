FactoryBot.define do
  factory :space do
    title { "space1" }
    postal { "111-1111" }
    address { 1 }
    tel { 11111111111 }
    capacity { 1 }
    content { "場所は北海道です" }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/noimage2.jpg')) }
    user { User.first || association(:user) }
  end

  factory :second_space, class: Space do
    title { "space2" }
    postal { "222-2222" }
    address { 2 }
    tel { 22222222222 }
    capacity { 2 }
    content { "場所は青森です" }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/noimage2.jpg')) }
    user { User.first }
  end

  factory :third_space, class: Space do
    title { "space3" }
    postal { "333-3333" }
    address { 3 }
    tel { 33333333333 }
    capacity { 3 }
    content { "場所は東京です" }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/noimage2.jpg')) }
    user { User.first }
  end

  factory :fourth_space, class: Space do
    title { "space4" }
    postal { "444-4444" }
    address { 4 }
    tel { 44444444444 }
    capacity { 4 }
    content { "場所は京都です" }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/noimage2.jpg')) }
    user { User.find_by(id: User.first.id + 1) || association(:second_user) }
  end

  # trait :with_picture do
  #   picture { File.new("#{Rails.root}/spec/fixtures/noimage2.jpg") }
  # end
end
