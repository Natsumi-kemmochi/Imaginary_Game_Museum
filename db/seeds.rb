# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始"

olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "123456"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")
end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "123456"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
end

Game.find_or_create_by!(title: "勇者の冒険") do |game|
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.png"), filename:"sample-post1.png")
  game.caption = "古き良きPRG"
  game.main_text = "設定は遠慮なく生やしてください"
  game.user_id = 1
end

Game.find_or_create_by!(title: "ゾンビファーム") do |game|
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.png"), filename:"sample-post2.png")
  game.caption = "ゾンビ育成ゲーム"
  game.main_text = "育てたゾンビと共に未開の地を生きる"
  game.user_id = 2
end

Detail.find_or_create_by!(game_id: "1") do |detail|
  detail.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-1.png"), filename:"sample-post1-1.png")
  detail.sub_text = "これはどこでどうやって手に入る？"
  detail.game_id = 1
end

puts "seedの実行が完了しました"