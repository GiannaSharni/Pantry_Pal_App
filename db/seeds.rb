# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "cleaning database"
Recipe.destroy_all
User.destroy_all

puts "creating user"
user1 = User.create(email: "john@doe.com", password: "123456")
user2 = User.create(email: "jane@doe.com", password: "123456")
user3 = User.create(email: "test@cook.com", password: "123456")
puts "user has been created"

puts "creating three recipes"
recipe1 = Recipe.new(
  title: "pizza",
  description: "bla bla bla",
  ingredients: "cheese, tomato, dough",
  instructions: "do this and do that",
  categories: "vegan"
)
recipe1.user = user1
recipe1.save

recipe2 = Recipe.new(
  title: "cheesecake",
  description: "bla bla bla",
  ingredients: "gram crackers, butter, soft cheese, sugar",
  instructions: "do this and do that",
  categories: "dessert"
)
recipe2.user = user2
recipe2.save

recipe3 = Recipe.new(
  title: "steak",
  description: "bla bla bla",
  ingredients: "steack, garlic, butter, onion, parsely",
  instructions: "do this and do that",
  categories: "meat"
)
recipe3.user = user3
recipe3.save
puts "3 recipes created"
