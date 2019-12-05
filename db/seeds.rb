# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all
Cocktail.destroy_all
puts 'Database is clean now 🍹'

puts 'Creating ingredients...'
result = JSON.parse(open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
drinks = result['drinks']

drinks.each do |hash|
  hash.each do |k, v|
    Ingredient.create(name: v)
  end
end
puts 'Ingredients are created...'

puts 'Creating Cocktails...'

# 12.times do
#   url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
#   cocktails_serialized = open(url).read
#   cocktails = JSON.parse(cocktails_serialized)

#   cocktails["drinks"].each do |cocktail|
#     Cocktail.create(name: cocktail["strDrink"])
#     Dose.create(description: cocktail["strMeasure1"], ingredient_id: cocktail["strIngredient"], cocktail_id: cocktail["idDrink"])
#   end

  # 2.times do
  #   Review.create(rating: rand(1..5), content: comments_array.sample)
  # end
#end

  # Cocktail.create(name: "first")
  # Dose.create(description: "10cl", ingredient_id: "1", cocktail_id: "13")

cocktails = [
  {
    name: "Mojito",
    },
  {
    name: "Daiquiri",
    },
  {
    name: "Margarita",
    },
  {
    name: "Planter's Punch",
    },
  {
    name: "White Russian",
    },
  {
    name: "Mojito Coco",
    },
  {
    name: "Moloko",
    },
  {
    name: "Gin Fizz",
    },
  {
    name: "Bloody Mary",
    },
  {
    name: "Irish Coffee",
    },
  {
    name: "Whiskey Sour",
    },
  {
    name: "Cosmopolitan",
    }
]
cocktails.each { |cocktail| Cocktail.create(cocktail) }
puts 'Cocktails are created...'

puts 'Creating Doses...'
descriptions = ["0.15l", "0.25l", "0.30l", "0.40l", "0.50l", "1l", "a little bit"]
3.times do
  counter = 0
  12.times do
    Dose.create(description: descriptions.sample, ingredient_id: rand(1..160), cocktail_id: counter += 1)
  end
end
puts 'Doses are created...'

puts 'Creating Reviews...'
user_comments = ["cool !", "better with a lot of ice !!", "So tasty !", "Really disgusting 🤮", "Wicked, I love it !", "Need more alcool :) 🍹"]

3.times do
counter = 0
  12.times do
    Review.create(content: user_comments.sample, rating: rand(1..5), cocktail_id: counter += 1)
  end
end
puts 'Reviews are created...'

puts 'Finished!'
