# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始"

名もなき投稿者 = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "名もなき投稿者"
  user.password = "123456"
  user.introduction = "いつか皆と考えたゲームを完成させたいと思っています。よろしくお願いします。"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")
end

じぇーむず = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "じぇーむず"
  user.password = "123456"
  user.introduction = "のんびりした世界観が好き"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
end

ルーカス = User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "ルーカス"
  user.password = "123456"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")
end

Game.find_or_create_by!(id: "1") do |game|
  game.title = "勇者の冒険"
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.png"), filename:"sample-post1.png")
  game.caption = "古き良きPRG"
  game.main_text = "設定は遠慮なく生やしてください"
  game.user_id = 1
end

Game.find_or_create_by!(id: "2") do |game|
  game.title = "ゾンビファーム"
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.png"), filename:"sample-post2.png")
  game.caption = "ゾンビ育成ゲーム"
  game.main_text = "育てたゾンビと共に未開の地を生きる"
  game.user_id = 2
end

Game.find_or_create_by!(id: "3") do |game|
  game.title = "Hakoniwa"
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.png"), filename:"sample-post3.png")
  game.caption = "自分だけの素敵な箱庭を作ろう！"
  game.main_text = ""
  game.user_id = 3
end

Game.find_or_create_by!(id: "4") do |game|
  game.title = "陰に潜むなにか"
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg")
  game.caption = "純和風ホラー"
  game.main_text = ""
  game.user_id = 1
end

Game.find_or_create_by!(title: "5") do |game|
  game.title = "妖精の国"
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg")
  game.caption = "儚く美しい物語"
  game.main_text = ""
  game.user_id = 1
end

Detail.find_or_create_by!(id: "1") do |detail|
  detail.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-1.png"), filename:"sample-post1-1.png")
  detail.sub_text = "これを入手した経緯は？"
  detail.game_id = 1
end

Detail.find_or_create_by!(id: "2") do |detail|
  detail.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-2.png"), filename:"sample-post1-2.png")
  detail.sub_text = "頼れる仲間たち"
  detail.game_id = 1
end

Detail.find_or_create_by!(id: "3") do |detail|
  detail.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-3.png"), filename:"sample-post1-3.png")
  detail.sub_text = "このモンスターを　⇒倒す？／⇒仲間にする"
  detail.game_id = 1
end

Detail.find_or_create_by!(id: "4") do |detail|
  detail.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-4.png"), filename:"sample-post1-4.png")
  detail.sub_text = "どうして魔王はこの世界を支配したいんだろう？"
  detail.game_id = 1
end

Detail.find_or_create_by!(id: "5") do |detail|
  detail.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-5.png"), filename:"sample-post1-5.png")
  detail.sub_text = "上位存在の目的とは……"
  detail.game_id = 1
end

puts "seedの実行が完了しました"