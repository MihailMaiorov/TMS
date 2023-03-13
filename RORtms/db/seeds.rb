# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# CATEGORIES_PATH = 'https://api.chucknorris.io/jokes/categories'.freeze
# JOKE_PATH = 'https://api.chucknorris.io/jokes/random?category='.freeze

# categories_request = Curl.get(CATEGORIES_PATH)

# JSON(categories_request.body).each do |category_name|
#   category = Category.create(title: category_name)

#   100.times { Joke.create(body: JSON(Curl.get(JOKE_PATH + category_name).body)['value'], category_id: category.id) }
# end

20.times do
  Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: Faker::Name.name
  )

  Supplier.create(name: Faker::Company.name)

  Customer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: Faker::Name.name,
    visits: Faker::Number.number(digits: 5),
    lock_version: Faker::Number.within(range: 0..1)
  )

  Order.create(
    date_submitted: Faker::Date.between(from: 5.days.ago, to: Date.today),
    status: Faker::Number.within(range: 0..1),
    subtotal: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    shipping: Faker::Number.within(range: 1.0..50.0),
    tax: Faker::Number.within(range: 1.0..50.0),
    total: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    customer_id: Customer.pluck(:id).sample
  )
end

100.times do
  Book.create(
    title: Faker::Book.title,
    year_published: Faker::Number.within(range: 1900..2023),
    isbn: Faker::Number.number(digits: 13),
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    out_of_print: Faker::Boolean.boolean,
    views: Faker::Number.number(digits: 6),
    author_id: Author.pluck(:id).sample,
    supplier_id: Supplier.pluck(:id).sample
  )

  Review.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    rating: Faker::Number.within(range: 0..10),
    state: Faker::Number.within(range: 0..10),
    book_id: Book.pluck(:id).sample,
    customer_id: Customer.pluck(:id).sample
  )
end

Order.all.map do |order|
  book_ids_array = Book.pluck(:id).sample(10)
  order.book_ids = book_ids_array
end
