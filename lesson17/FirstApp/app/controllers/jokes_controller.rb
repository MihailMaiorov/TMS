class JokesController < ApplicationController
  HOST = 'https://api.chucknorris.io'.freeze
  CATEGORIES_PATH = '/jokes/categories'.freeze
  JOKE_FROM_CATEGORY_PATH = '/jokes/random?category='.freeze

  def random
    @category = params[:category]

    @random_jokes = make_joke_from_category_request(@category)['value']
  end

  def categories
    @categories = make_categories_request
  end

  private

  def make_categories_request
    categories_request = Curl.get(categories_url)
    JSON(categories_request.body)
  end

  def make_joke_from_category_request(category)
    joke_request = Curl.get(joke_from_category_url(category))
    JSON(joke_request.body)
  end

  def categories_url
    File.join(HOST, CATEGORIES_PATH)
  end

  def joke_from_category_url(category)
    File.join(HOST, JOKE_FROM_CATEGORY_PATH + category)
  end
end
