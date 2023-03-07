class JokesController < ApplicationController
  class BadJokeRequest < StandardError; end

  def random
    category = params[:category]

    @random_jokes = make_joke_request(category)

    render json: @random_jokes['body']
  rescue BadJokeRequest => e
    render json: e.message
  end

  def categories
    @categories = Category.pluck(:title)

    render json: @categories
  end

  def search
    query = params[:query]

    @result = make_search_request(query)

    render json: @result
  rescue BadJokeRequest => e
    render json: e.message
  end

  private

  def make_joke_request(category)
    return Joke.find(Joke.ids.sample) if category.nil?

    choosed_category = Category.where(title: category)
    raise BadJokeRequest, 'Wrong category' if choosed_category.empty?

    Joke.where(category_id: choosed_category).sample
  end

  def make_search_request(query)
    raise BadJokeRequest, 'Query must be minimum 3 letters' if query.nil? || query.size < 3

    search_request = Joke.where('body LIKE ?', "%#{query}%")

    { 'total' => search_request.size, 'result' => search_request }
  end
end
