# -----------------------------------------user----------------------------------------------
1.upto(6) do |i|
  User.create!(name: "user#{i}", email: "user#{i}@test.com", password: "user#{i}@test.com")
end

User.create!(name: "Admin", email: "admin@test.com", password: "admin@test.com", admin: true)

# -----------------------------------------pet----------------------------------------------

1.upto(3) do |i|
  Pet.create!(name: "cat#{i}", age: i, size: i, weight: i, content: i,
              image: open("#{Rails.root}/db/data/cat#{i}.jpg"), user_id: User.first.id)
end

1.upto(2) do |i|
  Pet.create!(name: "dog#{i}", age: i, size: i, weight: i, content: i,
              image: open("#{Rails.root}/db/data/dog#{i}.jpg"), user_id: User.first.id + 1)
end

1.upto(2) do |i|
  Pet.create!(name: "dog#{i}", age: i, size: i, weight: i, content: i,
              image: open("#{Rails.root}/db/data/dog#{i}.jpg"), user_id: User.find_by(admin: true).id)
end

# ---------------------------------------space----------------------------------------------

1.upto(4) do |i|
  Space.create!(title: "space#{i}", postal: "111-1111",address: "北海道札幌市中央区旭ケ丘#{i}",
                tel: "07012345678", capacity: 2, picture:open("#{Rails.root}/db/data/space#{i}.jpg"),
                content: "#{i}番目の物件です", user_id: User.find_by(admin: true).id)
end
5.upto(8) do |i|
  Space.create!(title: "space#{i}", postal: "222-2222",address: "神奈川県横浜市港南区" ,
                tel: "07087654321", capacity: i, picture:open("#{Rails.root}/db/data/space#{i}.jpg"),
                content: "#{i}番目の物件です", user_id: User.first.id)
end
9.upto(10) do |i|
  Space.create!(title: "space#{i}", postal: "333-3333",address: "東京都渋谷区円山町" ,
                tel: "07087654321", capacity: i, picture:open("#{Rails.root}/db/data/space#{i}.jpg"),
                content: "#{i}番目の物件です", user_id: User.first.id + 1)
end

# ---------------------------------------space-subphoto----------------------------------------------

1.upto(10) do |i|
  5.times do
    Subphoto.create!(subpicture:open("#{Rails.root}/db/data/space#{rand(1..10)}.jpg"), space_id: i)
  end
end


# -----------------------------------------tag-tagging------------------------------------------------

list = %w(イヌ ネコ ヒツジ ヤギ トナカイ インコ 文鳥 タカ サル ヘビ 金魚 メダカ トカゲ ヤモリ カンガルー トムソンガゼル ハスキー ハリネズミ ロバ ウマ ハムスター )

list.each do |tag|
  ActsAsTaggableOn::Tag.new(name: tag).save
end

1.upto(10) do |n|
  tag = ActsAsTaggableOn::Tag.all.shuffle.take(rand(3..4))
  space = Space.find(n)
  space.tags << tag
end


