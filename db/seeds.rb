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
  game.main_text = "「勇者の冒険」は、若き勇者アレンが故郷の村を守るため、未知の世界へ旅立つ物語。村を襲った魔物の影響で村人たちは恐れおののき、アレンは祖父から受け継いだ剣を手に、伝説の魔法使いを探す決意をする。 旅の途中、アレンは弓使いリナ、戦士カイル、謎めいた魔法使いセリーナと出会う。彼らはそれぞれの目的を抱えつつ、共に旅をする。仲間たちは試練を乗り越え、友情を深めながら過去を明かしていく。 しかし、アレンの前には常に謎めいた影が立ちはだかり、真の敵は誰なのか分からない。暗黒の魔王の存在が囁かれ、彼の目的には大きな秘密が隠されている。アレンは村人たちを守るための強い思いを抱き、運命の城へ近づいていく。 果たして、彼らは真の敵に立ち向かうことができるのか。アレンの選択が村の未来をどう変えるのか、旅の行く先には未知の運命が待っている。仲間との絆を信じ、最後の試練に挑む。"
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

Game.find_or_create_by!(id: "5") do |game|
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