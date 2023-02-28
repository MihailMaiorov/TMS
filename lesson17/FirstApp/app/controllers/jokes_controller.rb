class JokesController < ApplicationController
  class BadJokeRequest < StandardError; end

  HOST = 'https://api.chucknorris.io'.freeze
  CATEGORIES_PATH = '/jokes/categories'.freeze
  RANDOM_JOKE_PATH = '/jokes/random'.freeze
  JOKE_FROM_CATEGORY_PATH = '/jokes/random?category='.freeze
  SEARCH_PATH = '/jokes/search?query='.freeze

  def random
    @category = params[:category]

    @random_jokes = make_joke_request(@category)['value']
  rescue BadJokeRequest => e
    render json: e.message
  end

  def categories
    @categories_result = make_categories_request
  end

  def search
    @query = params[:query]
    raise BadJokeRequest, 'Unknown path' if @query.nil?

    @search_result = make_search_request(@query)
  rescue BadJokeRequest => e
    render json: e.message
  end

  private

  def make_categories_request
    categories_request = Curl.get(categories_url)
    JSON(categories_request.body)
  end

  def make_joke_request(category)
    joke_request = Curl.get(joke_url(category))
    result = JSON(joke_request.body)
    raise BadJokeRequest, error_message(result) if joke_request.status >= '400'

    result
  end

  def make_search_request(query)
    joke_request = Curl.get(search_url(query))
    result = JSON(joke_request.body)
    raise BadJokeRequest, error_message(result) if joke_request.status >= '400'

    result
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

  def search_url(query)
    File.join(HOST, SEARCH_PATH + query)
  end

  def error_message(response)
    response['message'] || 'Unknown Error'
  end
end
