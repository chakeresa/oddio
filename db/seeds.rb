# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Landmark.destroy_all

Landmark.create!(name: 'hill', lat: 38.99, long: -104.99, category: 'park')
Landmark.create!(name: 'farm', lat: 39.12, long: -102.99, category: 'museum')
Landmark.create!(name: 'place', lat: 39.59, long: -103.89, category: 'museum')
Landmark.create!(name: 'here', lat: 39.49, long: -103.19, category: 'theater')
Landmark.create!(name: 'there', lat: 39.29, long: -102.76, category: 'museum')
