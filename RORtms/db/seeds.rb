# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CATEGORIES_PATH = 'https://api.chucknorris.io/jokes/categories'.freeze
JOKE_PATH = 'https://api.chucknorris.io/jokes/random?category='.freeze

categories_request = Curl.get(CATEGORIES_PATH)

JSON(categories_request.body).each do |category_name|
  category = Category.create(title: category_name)

  100.times { Joke.create(body: JSON(Curl.get(JOKE_PATH + category_name).body)['value'], category_id: category.id) }
end
