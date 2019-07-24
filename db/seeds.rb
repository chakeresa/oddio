# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: "shmeeshmail@yahoo.com", first_name: "Nunya", last_name: "Business", display_name: "Nar")

landmark = Landmark.create(lat: 39.7392358, long: -104.990251, name: "Cool Place", address: "123 Place", phone_number: "867-5309", category: "Museum")

recording = Recording.create(title: "Place is RAD", url: "https://www.botanicgardens.org/", user: user, landmark: landmark)
