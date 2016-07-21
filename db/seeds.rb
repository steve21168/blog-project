# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: "Dave", email: "dave@aol.com", password: "password")
u2 = User.create(name: "Bob", email: "bob@aol.com", password: "password")

p1 = Post.create(title: "1st post", content: "So much to say hey hey hey", user: u1)
p1 = Post.create(title: "2nd post", content: "Oh yeahh 2nd post !", user: u1)
p1 = Post.create(title: "3rd post", content: "Bodda bing badda boom!", user: u2)
