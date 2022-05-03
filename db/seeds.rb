# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

people = ["Claudio", "Ale", "Mauricio"]

10.times do |i|
    Post.create(
        title: Faker::Movies::Lebowski.actor,
        description: Faker::Movies::Lebowski.quote,
        image_url: Faker::Avatar.image,
        author: people.sample,
        status: rand(0..3)
    )
end
