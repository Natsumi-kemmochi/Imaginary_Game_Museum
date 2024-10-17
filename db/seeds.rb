# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始"

#　------ユーザー------------

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

猫又 = User.find_or_create_by!(email: "2tailscat@example.com") do |user|
  user.name = "猫又"
  user.password = "123456"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_img.png"), filename:"no_img.png")
end


Fuumin = User.find_or_create_by!(email: "sleeper@example.com") do |user|
  user.name = "Fuumin"
  user.password = "123456"
  user.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_img.png"), filename:"no_img.png")
end





# -------ゲーム記事--------------

Game.find_or_create_by!(id: "1") do |game|
  game.title = "勇者の冒険"
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.png"), filename:"sample-post1.png")
  game.caption = "友情と運命が交錯する冒険。若き勇者アレンの結末は"
  game.main_text = "若き勇者アレンが故郷の村を守るため、未知の世界へ旅立つ。村を襲った魔物の影響で村人たちは恐れおののき、アレンは祖父から受け継いだ剣を手に、伝説の魔法使いを探す決意をする。 旅の途中、アレンは弓使いリナ、戦士カイル、謎めいた魔法使いセリーナと出会う。彼らはそれぞれの目的を抱えつつ、共に旅をする。仲間たちは試練を乗り越え、友情を深めながら過去を明かしていく。 しかし、アレンの前には常に謎めいた影が立ちはだかり、真の敵は誰なのか分からない。暗黒の魔王の存在が囁かれ、彼の目的には大きな秘密が隠されている。アレンは村人たちを守るための強い思いを抱き、運命の城へ近づいていく。 果たして、彼らは真の敵に立ち向かうことができるのか。アレンの選択が村の未来をどう変えるのか、旅の行く先には未知の運命が待っている。仲間との絆を信じ、最後の試練に挑む。"
  game.user_id = 1
end

Game.find_or_create_by!(id: "2") do |game|
  game.title = "ゾンビファーム"
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.png"), filename:"sample-post2.png")
  game.caption = "育てたゾンビと共に未開の地を生きる"
  game.main_text = "「ゾンビファーム」は、育てたゾンビたちと共に未開の地でのんびり生活するシミュレーションゲーム。プレイヤーは、個性豊かなゾンビを育成し、農業や資源収集を行いながら、独自のファームを築く。舞台は自然豊かな不思議な土地。ゾンビたちに食べ物を与えたり、特別なアイテムで成長を促したりして、彼らを強化していく。各ゾンビは異なるスキルや特性を持ち、農業や冒険に役立てられる。可愛らしい見た目のゾンビたちは、ユニークなアニメーションでプレイヤーを楽しませる。時には予想外の行動を取って、思わず笑ってしまう瞬間も。"
  game.user_id = 2
end

Game.find_or_create_by!(id: "3") do |game|
  game.title = "Hakoniwa"
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.png"), filename:"sample-post3.png")
  game.caption = "自分だけの素敵な箱庭を作ろう！"
  game.main_text = "「Hakoniwa」は、自分だけの素敵な箱庭を自由に作り上げるシミュレーションゲーム。美しい自然や可愛らしいキャラクターたちと共に、平和な世界を築くことも、プレイスタイル次第で世紀末的な荒廃した風景を創り出すことも可能。土地をカスタマイズし、建物や植物、キャラクターを配置して、思い描く世界を実現しよう。他のプレイヤーとの交流や、共同でイベントを楽しむ要素も豊富。個性的なデザインやアイディアを活かして、自分だけの箱庭を作り上げる楽しさが詰まった作品だ。どんな箱庭が生まれるのか、無限の可能性が待っている。"
  game.user_id = 3
end

Game.find_or_create_by!(id: "4") do |game|
  game.title = "陰に潜むなにか"
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg")
  game.caption = "真実を求め、闇の中へ"
  game.main_text = "古い神社で起こる奇怪な現象に巻き込まれる主人公。村の伝説や噂話に耳を傾けながら、夜ごとに現れる影や不気味な声が、村人たちの心に恐怖を植え付ける。友人や家族の失踪。村の過去に隠された秘密。果たして、その「なにか」の正体を突き止め、村を救うことができるのか。影が忍び寄る中、謎は深まるばかり。"
  game.user_id = 1
end

Game.find_or_create_by!(id: "5") do |game|
  game.title = "妖精の国"
  game.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg")
  game.caption = "失われた魔法を取り戻し、妖精たちの国に再び光を"
  game.main_text = "主人公が夢の中で迷い込んだ、儚く美しい妖精たちの世界が舞台。そこは色とりどりの花が咲き乱れ、透き通るような川が流れる幻想的な場所。しかし、妖精たちは何者かに奪われた魔法の宝石によって、その力を失い、国は徐々に色を失っていく。主人公は、妖精たちと共に失われた宝石を探す旅に出る。途中、様々な試練や出会いを通じて、友情や愛の大切さを学びながら、やがて自らの使命に目覚めていく。"
  game.user_id = 1
end



# ---------詳細記事-------------

Detail.find_or_create_by!(id: "1") do |detail|
  detail.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-1.png"), filename:"sample-post1-1.png")
  detail.caption = "これを入手した経緯は？"
  detail.sub_text = "皆さんでアイディアを出してください"
  detail.game_id = 1
end

Detail.find_or_create_by!(id: "2") do |detail|
  detail.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-2.png"), filename:"sample-post1-2.png")
  detail.caption = "頼れる仲間たち"
  detail.game_id = 1
end

Detail.find_or_create_by!(id: "3") do |detail|
  detail.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-3.png"), filename:"sample-post1-3.png")
  detail.caption = "このモンスターを　⇒倒す？／⇒仲間にする"
  detail.game_id = 1
end

Detail.find_or_create_by!(id: "4") do |detail|
  detail.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-4.png"), filename:"sample-post1-4.png")
  detail.caption = "どうして魔王はこの世界を支配したいんだろう？"
  detail.game_id = 1
end

Detail.find_or_create_by!(id: "5") do |detail|
  detail.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1-5.png"), filename:"sample-post1-5.png")
  detail.caption = "上位存在の目的とは……"
  detail.game_id = 1
end





# -------コメント---------------

GameComment.find_or_create_by!(id: "1") do |game_comment|
  game_comment.comment = "アレンが魔王の父親だって知ったとき、マジで衝撃だったわ。村を襲ったのも試すためって……どういうこと！？最後の戦いでアレンが父を受け入れるシーン、泣けた。"
  game_comment.user_id = "2"
  game_comment.game_id = "1"
end

GameComment.find_or_create_by!(id: "2") do |game_comment|
  game_comment.comment = "セリーナの正体が魔王の妹ってのもビックリ。兄と対決するシーン、彼女のセリフが重かった。まさかそんな背景があったとは思わなかった。"
  game_comment.user_id = "3"
  game_comment.game_id = "1"
end

GameComment.find_or_create_by!(id: "3") do |game_comment|
  game_comment.comment = "リナがアレンを助けるために自分を犠牲にしようとするシーン、ハラハラしたわ。結局、彼女の魔法がアレンに力を与える形で、二人の絆が試される展開、やばかった。"
  game_comment.user_id = "4"
  game_comment.game_id = "1"
end

GameComment.find_or_create_by!(id: "4") do |game_comment|
  game_comment.comment = "アレンの剣、ただの「じいちゃんの剣」じゃなくて、村の守護神の力が宿ってたってオチが最高だった。ラストバトルでその力が目覚めるシーン、興奮した。"
  game_comment.user_id = "2"
  game_comment.game_id = "1"
end

GameComment.find_or_create_by!(id: "5") do |game_comment|
  game_comment.comment = "アレンが村の長になるエンディング、最高だな。村人たちが彼を称えるシーンで泣いた。父親との確執を乗り越えた証だもんな。"
  game_comment.user_id = "3"
  game_comment.game_id = "1"
end

GameComment.find_or_create_by!(id: "6") do |game_comment|
  game_comment.comment = "カイルが実は元暗黒の魔王の手下とか、最初の印象と全然違う！でも最終的にアレンを守るために命かけるって展開が熱すぎた。"
  game_comment.user_id = "4"
  game_comment.game_id = "1"
end

GameComment.find_or_create_by!(id: "7") do |game_comment|
  game_comment.comment = "セリーナが魔法を完全にコントロールするシーン、印象に残った。兄との対決で彼女の力がカギになるとは思わなかったわ。"
  game_comment.user_id = "2"
  game_comment.game_id = "1"
end

GameComment.find_or_create_by!(id: "8") do |game_comment|
  game_comment.comment = "アレンが「父としてではなく、魔王として倒す」と言った瞬間、鳥肌立った。あの一言、重すぎて心に響いた。"
  game_comment.user_id = "3"
  game_comment.game_id = "1"
end

GameComment.find_or_create_by!(id: "9") do |game_comment|
  game_comment.comment = "カイルが「俺はかつて魔王だったが、今は仲間だ」と言って立ち向かうシーン、カッコよすぎ！彼の過去を乗り越える姿が最高だった。"
  game_comment.user_id = "4"
  game_comment.game_id = "1"
end

GameComment.find_or_create_by!(id: "10") do |game_comment|
  game_comment.comment = "リナの犠牲がアレンの成長のきっかけになるのが切なかった。彼女の思いがアレンに力を与えるシーンは本当に泣けた"
  game_comment.user_id = "2"
  game_comment.game_id = "1"
end

GameComment.find_or_create_by!(id: "11") do |game_comment|
  game_comment.comment = "皆さんたくさんの感想（幻覚）ありがとうございます"
  game_comment.user_id = "1"
  game_comment.game_id = "1"
end

# -------ブックマーク---------------
Bookmark.find_or_create_by!(id: "1") do |bookmark|
  bookmark.user_id = "1"
  bookmark.game_id = "2"
end
Bookmark.find_or_create_by!(id: "2") do |bookmark|
  bookmark.user_id = "1"
  bookmark.game_id = "3"
end

# -------いいね---------------
Favorite.find_or_create_by!(id: "1") do |favorite|
  favorite.user_id = "1"
  favorite.game_comment_id = "1"
end

# -------フォロー---------------
Relationship.find_or_create_by!(id: "2") do |relationship|
  relationship.follower_id = "1"
  relationship.followed_id = "2"
end

Relationship.find_or_create_by!(id: "3") do |relationship|
  relationship.follower_id = "1"
  relationship.followed_id = "3"
end


# -------管理者---------------
Admin.create(email: 'admin@example.com', 
             password: '123456')

puts "seedの実行が完了しました"