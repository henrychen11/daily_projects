# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Sub.destroy_all

user1 = User.new(name: Faker::Name.name, password: '123456')
user2 = User.new(name: Faker::Name.name, password: '123456')
user3 = User.new(name: Faker::Name.name, password: '123456')
user4 = User.new(name: Faker::Name.name, password: '123456')
user5 = User.new(name: Faker::Name.name, password: '123456')

user1.save
user2.save
user3.save
user4.save
user5.save

sub1 = Sub.new(name: Faker::Name.name, description: Faker::ChuckNorris.fact, moderator_id: user1.id )
sub3 = Sub.new(name: Faker::Name.name, description: Faker::ChuckNorris.fact, moderator_id: user1.id )
sub3 = Sub.new(name: Faker::Name.name, description: Faker::ChuckNorris.fact, moderator_id: user2.id )
sub4 = Sub.new(name: Faker::Name.name, description: Faker::ChuckNorris.fact, moderator_id: user2.id )
sub5 = Sub.new(name: Faker::Name.name, description: Faker::ChuckNorris.fact, moderator_id: user3.id )
sub6 = Sub.new(name: Faker::Name.name, description: Faker::ChuckNorris.fact, moderator_id: user3.id )

sub1.save
sub3.save
sub3.save
sub4.save
sub5.save
sub6.save
