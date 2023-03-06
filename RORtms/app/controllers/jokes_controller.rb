class JokesController < ApplicationController
  class BadJokeRequest < StandardError; end

  def random
    @category = params[:category]

    @random_jokes = make_joke_request(@category)['body']

    render json: @random_jokes
  rescue BadJokeRequest => e
    render json: e.message
  end

  def categories
    @categories = make_categories_request

    render json: @categories
  end

  def search
    @query = params[:query]

    @search_result = make_search_request(@query)

    render json: @search_result
  rescue BadJokeRequest => e
    render json: e.message
  end

  private

  def make_joke_request(category)
    return Joke.all.sample if category.nil?

    choosed_category = Category.where(title: category)
    raise BadJokeRequest, 'Wrong category' if choosed_category.empty?

    Joke.where(category_id: choosed_category).sample
  end

  def make_categories_request
    Category.all.map { |category| category['title'] }
  end

  def make_search_request(query)
    raise BadJokeRequest, 'Query must be minimum 3 letters' if query.nil? || query.size < 3

    search_request = Joke.all.select { |joke| joke['body'].include?(query) }
    { 'total' => search_request.size, 'result' => search_request }
  end
end
