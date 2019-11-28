# 1.upto(6) do |i|
#   User.create!(name: "user#{i}", email: "user#{i}@test.com", password: "user#{i}@test.com")
# end

# User.create!(name: "Admin", email: "admin@test.com", password: "admin@test.com", admin: true)
# admin = User.where(admin: true)

# 1.upto(3) do |i|
#   Pet.create!(name: "cat#{i}", age: i, size: i, weight: i, content: i,
#               image: open("#{Rails.root}/db/data/cat#{i}.jpg"), user_id: User.first.id)
# end

# 1.upto(2) do |i|
#   Pet.create!(name: "dog#{i}", age: i, size: i, weight: i, content: i,
#               image: open("#{Rails.root}/db/data/dog#{i}.jpg"), user_id: User.first.id + 2)
# end

# 1.upto(2) do |i|
#   Space.create!(title: "space#{i}", postal: "111-1111",address: "北海道",
#                 tel: "07012345678", capacity: 2, picture:open("#{Rails.root}/db/data/window.jpg"),
#                 content: "#{i}番目の物件です", user_id: User.first.id)
# end
# 3.upto(4) do |i|
#   Space.create!(title: "space#{i}", postal: "222-2222",address: i ,
#                 tel: "07087654321", capacity: i, picture:open("#{Rails.root}/db/data/window.jpg"),
#                 content: "#{i}番目の物件です", user_id: User.first.id + 1)
# end