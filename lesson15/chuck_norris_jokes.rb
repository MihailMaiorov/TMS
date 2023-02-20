require 'curb'
require 'json'

class ChuckNorrisJokes
  class WrongCategoryError < StandardError; end

  HOST = 'https://api.chucknorris.io'.freeze
  CATEGORIES_PATH = '/jokes/categories'.freeze
  JOKES_PATH = '/jokes/random?category='.freeze

  class << self
    def call_categories
      make_categories_request.each_with_index { |category, index| puts "#{index + 1} - #{category}" }
    end

    def call_joke(user_input)
      make_joke_request(user_input)['value']
    rescue WrongCategoryError => e
      e.message
    end

    private

    def make_categories_request
      categories_request = Curl.get(categories_url)
      JSON(categories_request.body)
    end

    def make_joke_request(user_input)
      raise WrongCategoryError, 'Wrong category number' unless (0...make_categories_request.size).include?(user_input)

      user_choose = make_categories_request[user_input]
      joke_request = Curl.get(joke_url(user_choose))
      JSON(joke_request.body)
    end

    def categories_url
      File.join(HOST, CATEGORIES_PATH)
    end

    def joke_url(user_choose)
      File.join(HOST, JOKES_PATH + user_choose)
    end
  end
end

loop do
  puts 'Choose category:'
  ChuckNorrisJokes.call_categories

  user_input = gets.to_i - 1

  puts ChuckNorrisJokes.call_joke(user_input)
end
