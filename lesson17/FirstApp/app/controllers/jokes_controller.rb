class JokesController < ApplicationController
  HOST = 'https://api.chucknorris.io'.freeze
  CATEGORIES_PATH = '/jokes/categories'.freeze
  RANDOM_JOKE_PATH = '/jokes/random'.freeze
  JOKE_FROM_CATEGORY_PATH = '/jokes/random?category='.freeze
  SEARCH_PATH = '/jokes/search?query='.freeze

  def random
    @category = params[:category]

    @random_jokes = make_joke_from_category_request(@category)['value']
  end

  def categories
    @categories = make_categories_request
  end

  def search
    # @text = params[:search]
    @text = 'tracks'
    @search = make_search_request(@text)
  end

  private

  def make_categories_request
    categories_request = Curl.get(categories_url)
    JSON(categories_request.body)
  end

  def make_joke_from_category_request(category)
    joke_request = Curl.get(joke_url(category))
    JSON(joke_request.body)
  end

  def make_search_request(text)
    joke_request = Curl.get(search_url(text))
    JSON(joke_request.body)
  end

  def categories_url
    File.join(HOST, CATEGORIES_PATH)
  end

  def joke_url(category = nil)
    if category.nil?
      File.join(HOST, RANDOM_JOKE_PATH)
    else
      File.join(HOST, JOKE_FROM_CATEGORY_PATH + category)
    end
  end

  def search_url(text)
    File.join(HOST, SEARCH_PATH + text)
  end
end
