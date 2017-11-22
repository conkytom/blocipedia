# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
pw = Faker::Internet.password

15.times do
    user = User.new(
        email: Faker::Internet.email,
        password: 'thomas',
        password_confirmation: 'thomas'
    )
    user.skip_confirmation!
    user.save!
end
users = User.all

50.times do
    wiki = Wiki.create!(
        user_id: rand(1..14),
        title: Faker::Beer.name,
        body: Faker::Lorem.paragraphs
    )
end
wikis = Wiki.all

user = User.new(
    email: "tmconkwright@gmail.com",
    password: 'thomas',
    password_confirmation: 'thomas'
)
user.skip_confirmation!
user.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
