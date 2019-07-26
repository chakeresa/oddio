#CONSOLE COMMANDS
AppAuth.destroy_all
GoogleAuth.destroy_all
TourRecording.destroy_all
Tour.destroy_all
Recording.destroy_all
User.destroy_all

# USERS
user_1 = User.create!(email: "shmeeshmail@yahoo.com", first_name: "Nunya", last_name: "Business", display_name: "Nar")
AppAuth.create!(user: user_1, username: "Nunyanar", password: "password")

user_2 = User.create!(email: "severly@nlspam.cf", first_name: "Benjamin", last_name: "Clementine", display_name: "benjiboio")
AppAuth.create!(user: user_2, username: "benjiboio", password: "password")

user_3 = User.create!(email: "glaaroussi.ouahbn@elbow4.tk", first_name: "Vanya", last_name: "Mikelretch", display_name: "Vanya")
AppAuth.create!(user: user_3, username: "Filandrothrope", password: "password")

user_4 = User.create!(email: "etlem@bzymail.top", first_name: "Jefferson", last_name: "Whitehead", display_name: "JWhitehead")
AppAuth.create!(user: user_4, username: "GrassEater", password: "password")

user_5 = User.create!(email: "wabhifb07v@myhagiasophia.com", first_name: "Frank", last_name: "Brandswater", display_name: "Brandswater")
AppAuth.create!(user: user_5, username: "fbrandswater", password: "password")

user_6 = User.create!(email: "ejakub.k@domainaing.cf", first_name: "Grace", last_name: "Predente", display_name: "Predente")
AppAuth.create!(user: user_6, username: "HolyGrace", password: "password")

user_7 = User.create!(email: "7wanderson.silza@mmspa.cf", first_name: "Selma", last_name: "Graniour", display_name: "Graniour")
AppAuth.create!(user: user_7, username: "SelmySelms", password: "password")

user_8 = User.create!(email: "basdsx98o@apagitu.info.tm", first_name: "Persephone", last_name: "Orelia", display_name: "POrelia")
AppAuth.create!(user: user_8, username: "perseophoneo", password: "password")

user_9 = User.create!(email: "hoblas7@emailibre.com", first_name: "Matthew", last_name: "Merchant", display_name: "MMerchant")
AppAuth.create!(user: user_9, username: "MMerchant1287", password: "password")

user_10 = User.create!(email: "4zianiziani.2@ezvsmk.tk", first_name: "Phoebe", last_name: "Halliwell", display_name: "PHalliewell")
AppAuth.create!(user: user_10, username: "powerothree", password: "password")

admin = User.create!(role: "admin", email: "admin@example.com", first_name: "Bossy", last_name: "McBossface", display_name: "BossyMcBossface")
AppAuth.create!(user: admin, username: "bossypants", password: "adminpassword")

# LANDMARKS
buell = Landmark.where(place_id: "ChIJv6fqK854bIcREz-R0Panwd4").first
art_gallery = Landmark.where(place_id: "ChIJI3JicMN4bIcRE5JBd4aTO0o").first
museum = Landmark.where(place_id: "ChIJvcHQQcF4bIcRmDttJRd0FN4").first
axe_room = Landmark.where(place_id: "ChIJ5c4iVtl4bIcRJnnxpj0RIuA").first
lodo = Landmark.where(place_id: "ChIJux94CcN4bIcRcH7lFkSAUfo").first

# RECORDINGS
recording_1 = Recording.create!(title: '"Don Giovanni"',
                 url: "https://oddio1903.s3.us-east-2.amazonaws.com/a74401d47b4d40de7760cc73b5449659.mp3",
                 user: user_1,
                 landmark: buell)
recording_2 = Recording.create!(title: "I hate my job",
                 url: "https://oddio1903.s3.us-east-2.amazonaws.com/7b66a05063f0ec4bb3f509875943b118.mp3",
                 user: user_2,
                 landmark: axe_room)
recording_3 = Recording.create!(title: "Bro Night!",
                 url: "https://oddio1903.s3.us-east-2.amazonaws.com/74d884ad530c6f108c5244a2d21b0393.mp3",
                 user: user_3,
                 landmark: axe_room)
recording_4 = Recording.create!(title: "Great Breakup Spot!1!!!",
                 url:  "https://oddio1903.s3.us-east-2.amazonaws.com/af0e63e6888087d3c22a917c82815cfb.mp3",
                 user: user_4,
                 landmark: axe_room)
recording_5 = Recording.create!(title: "Tattooed Lemons???",
                 url: "https://oddio1903.s3.us-east-2.amazonaws.com/baba061308bd82145ff5ce52eeb9bd0d.mp3",
                 user: user_5,
                 landmark: museum)
recording_6 = Recording.create!(title: "The Thrill of It All!",
                 url: "https://oddio1903.s3.us-east-2.amazonaws.com/d90728dd57561f0f7413c825541dfdaa.mp3",
                 user: user_6,
                 landmark: museum)
recording_7 = Recording.create!(title: "Museums are quiet",
                 url: "https://oddio1903.s3.us-east-2.amazonaws.com/23a4a51549a917ed7c30629bce854902.mp3",
                 user: user_7,
                 landmark: museum)
recording_8 = Recording.create!(title: "It's a fine gallery",
                 url: "https://oddio1903.s3.us-east-2.amazonaws.com/8697242bb011a71be97c729bfa9e632c.mp3",
                 user: user_9,
                 landmark: art_gallery)
recording_9 = Recording.create!(title: "Art && Pot?? Why not!",
                 url: "https://oddio1903.s3.us-east-2.amazonaws.com/d2a8b4fd917ebf88700e2e243da7654c.mp3",
                 user: user_10,
                 landmark: art_gallery)
recording_10 = Recording.create!(title: "Be careful on these stairs",
                 url: "https://oddio1903.s3.us-east-2.amazonaws.com/db45bbb0fd9ab9376c552684a49e7cc0.mp3",
                 user: user_4,
                 landmark: lodo)

# TOURS & COMPONENTS
tour_1 = user_5.tours.create!(title: "Downtown Shenanigans")
         TourRecording.create!(tour: tour_1, recording: recording_5)
         TourRecording.create!(tour: tour_1, recording: recording_4)
         TourRecording.create!(tour: tour_1, recording: recording_6)
         TourRecording.create!(tour: tour_1, recording: recording_9)
         TourRecording.create!(tour: tour_1, recording: recording_10)

tour_2 = user_9.tours.create!(title: "My First Tour!")
         landmark = Landmark.where(place_id: "ChIJISHlw9l-bIcRl-J_-5IVSN8").first
         TourRecording.create!(tour: tour_2, recording: recording_3)
         TourRecording.create!(tour: tour_2, recording: recording_8)
