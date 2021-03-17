# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# user = User.create(username: "Nick")
# user.markers.build(title: "Hello from Rails", info: "coming from rails", lat: 45, lng: 45)
# user.save

# user = User.create(username: "HELLO")
# user.markers.build(title: "Hello from Rails", info: "coming from rails", lat: 30, lng: 45)
# user.save

# user = User.create(username: "SAM")
# user.markers.build(title: "Hello from Rails", info: "coming from rails", lat: 33, lng: 20)
# user.save
user = User.create(username: "Railsy")
map = Map.create(title: "Hello from rails")
map.users << user
map.markers.build(user_id: user.id, title: "Hello from Rails", info: "coming from rails", lat: 33, lng: 20)
map.save


map = Map.create(title: "Hello from rails")
map.users << user
map.markers.build(user_id: user.id, title: "Hello from Rails 2", info: "coming from rails", lat: 33, lng: 20)
map.public = true
map.save