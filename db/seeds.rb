# -----------------------------------------user----------------------------------------------
20.times do
  gimei = Gimei.new
  User.create(
    name: gimei.name.kanji,
    email: "user#{i}@test.com",
    password: "user#{i}@test.com"
  )
end

User.create!(name: "admin", email: "admin@test.com", password: "admin@test.com", admin: true)

User.create!(name: "test", email: "test@test.com", password: "test@test.com")

# -----------------------------------------pet----------------------------------------------

feat = %w(かわいい かっこいい いじっぱり やさしい おとなしい うるさい 力強い 寂しがり屋 気分屋 のんびり 動くのが好き 寒がり 暑がり のんき 我慢強い 怖がり)

30.times do
  gimei = Gimei.new
  Pet.create!(
    name: gimei.name.first.katakana,
    age: rand(1..20),
    size: rand(1..20),
    weight: rand(1..20),
    content: feat.sample,
    image: open("#{Rails.root}/db/data/pet#{rand(1..12)}.jpg"),
    user_id: User.all.sample.id
  )
end

# ---------------------------------------space----------------------------------------------
content = [
  "いい感じのスペースです","動物好きなホストがお出迎えします。どしどし質問してください","大きすぎるサイズの動物は受け入れできません",
  "カラフルなスペースです。","メゾネットタイプで、ペット専用のスペースも確保してあります。","爬虫類が大好きなホストのスペースです。水槽なしでも受け入れ可能です。",
  "臭いの付かない動物のみ受け入れ可です。","ペットを離せる大きな庭があります。","お散歩の代行も行っています。"
]

20.times do
  gimei = Gimei.new
  Space.create!(
    title: gimei.name.last.romaji,
    postal: "#{rand(100..999)}-#{rand(1000..9999)}",
    address: gimei.address.kanji,
    tel: "07032052235",
    capacity: rand(1..15)
    picture:open("#{Rails.root}/db/data/space#{i}.jpg"),
    content: content.sample,
    user_id: User.all.sample.id
  )
end


# ---------------------------------------space-subphoto----------------------------------------------

1.upto(20) do |i|
  5.times do
    Subphoto.create!(subpicture:open("#{Rails.root}/db/data/space#{rand(1..20)}.jpg"), space_id: i)
  end
end


# -----------------------------------------tag-tagging------------------------------------------------

list = %w(イヌ ネコ ヒツジ ヤギ トナカイ インコ 文鳥 タカ サル ヘビ 金魚 メダカ トカゲ ヤモリ カンガルー ガゼル ハスキー ハリネズミ ロバ ウマ ハムスター )

list.each do |tag|
  ActsAsTaggableOn::Tag.new(name: tag).save
end

1.upto(20) do |n|
  tag = ActsAsTaggableOn::Tag.all.shuffle.take(rand(3..4))
  space = Space.find(n)
  space.tags << tag
end


