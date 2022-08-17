# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


5.times do
    User.create(name: Faker::Name.name, photo:'https://unsplash.com/photos/F_-0BxGuVvo', bio: Faker::Lorem.sentence)
end

30.times do
    Post.create(author_id: Faker::Number.between(from: 1, to: 5), title: Faker::Lorem.word, text: Faker::Lorem.paragraph_by_chars)
end

200.times do
    Comment.create(post_id: Faker::Number.between(from: 1, to: 30), author_id: Faker::Number.between(from: 1, to: 5),text:Faker::Lorem.sentence)
end
200.times do
    Like.create(post_id: Faker::Number.between(from: 1, to: 30), author_id: Faker::Number.between(from: 1, to: 5))
end

