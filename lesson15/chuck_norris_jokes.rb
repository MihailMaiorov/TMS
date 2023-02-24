require 'curb'
require 'json'

class ChuckNorrisJokes
  class WrongCategoryError < StandardError; end

  HOST = 'https://api.chucknorris.io'.freeze
  CATEGORIES_PATH = '/jokes/categories'.freeze
  JOKE_FROM_CATEGORY_PATH = '/jokes/random?category='.freeze

  class << self
    def call_joke_from_category
      puts 'Choose category:'
      make_categories_request.each_with_index { |category, index| puts "#{index + 1} - #{category}" }

      user_input = gets.to_i - 1
      raise WrongCategoryError, 'Wrong category number' unless (0...make_categories_request.size).include?(user_input)

      make_joke_from_category_request(user_input)['value']
    rescue WrongCategoryError => e
      puts e.message
    end

    private

    def make_categories_request
      categories_request = Curl.get(categories_url)
      JSON(categories_request.body)
    end

    def make_joke_from_category_request(user_input)
      user_choose = make_categories_request[user_input]
      joke_request = Curl.get(joke_from_category_url(user_choose))
      JSON(joke_request.body)
    end

    def categories_url
      File.join(HOST, CATEGORIES_PATH)
    end

    def joke_from_category_url(user_choose)
      File.join(HOST, JOKE_FROM_CATEGORY_PATH + user_choose)
    end
  end
end
