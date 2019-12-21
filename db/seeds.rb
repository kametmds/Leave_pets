# -----------------------------------------user----------------------------------------------
1.upto(20) do |i|
  gimei = Gimei.new
  User.create(
    name: gimei.name.kanji,
    email: "user#{i}@test.com",
    password: "user#{i}@test.com",
    icon: open("#{Rails.root}/db/data/user.png")
  )
end

User.create!(name: "admin", email: "admin@test.com", password: "admin@test.com",
  icon: open("#{Rails.root}/db/data/user.png"), admin: true
)

User.create!(name: "test", email: "test@test.com", password: "test@test.com",
  icon: open("#{Rails.root}/db/data/user.png")
)

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

spot = [
  "神奈川県横浜市青葉区美しが丘","栃木県日光市吉沢","群馬県富岡市妙義町","栃木県下都賀郡壬生町","千葉県いすみ市上布施","栃木県日光市豊田",
  "茨城県つくばみらい市福原","神奈川県小田原市東町","埼玉県戸田市氷川町","埼玉県本庄市児玉町","神奈川県相模原市中央区","東京都稲城市矢野口",
  "東京都東大和市蔵敷","群馬県富岡市上高尾","埼玉県入間郡毛呂山町","埼玉県日高市北平沢","神奈川県横浜市中区","神奈川県鎌倉市笛田",
  "茨城県石岡市大塚","東京都府中市押立町","東京都新宿区市谷本村町","東京都台東区柳橋","東京都大田区大森本町","神奈川県横浜市中区南本牧",
  "東京都足立区扇","東京都豊島区長崎"
]

1.upto(20) do |i|
  gimei = Gimei.new
  Space.create!(
    title: gimei.name.last.romaji,
    postal: "#{rand(100..999)}-#{rand(1000..9999)}",
    address: spot.sample,
    tel: "07032052235",
    capacity: rand(1..15),
    picture: open("#{Rails.root}/db/data/space#{i}.jpg"),
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


