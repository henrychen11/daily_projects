# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Band.destroy_all

user1 = User.new(email: "test1@gmail.com", password: "1234567")
user2 = User.new(email: "test2@gmail.com", password: "1234567")
user3 = User.new(email: "test3@gmail.com", password: "1234567")

band1 = Band.new(name: "Epic Band 1")
band2 = Band.new(name: "Epic Band 2")
band3 = Band.new(name: "Epic Band 3")


user1.save
user2.save
user3.save

band1.save
band2.save
band3.save
