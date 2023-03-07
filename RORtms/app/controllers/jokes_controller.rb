class JokesController < ApplicationController
  class BadJokeRequest < StandardError; end

  def random
    category = params[:category]

    @random_jokes = make_joke_request(@category)['body']

    render json: @random_jokes
  rescue BadJokeRequest => e
    render json: e.message
  end

  def categories
    @categories = Category.pluck(:title)

    render json: @categories
  end

  def search
    raise BadJokeRequest, 'Query must be minimum 3 letters' unless params[:query].presence || params[:query].size > 2

    search_request = Joke.where("text LIKE ?", "%#{params[:query]}%")
    @result = { 'total' => search_request.size, 'result' => search_request }
    
    render json: @result
  rescue BadJokeRequest => e
    render json: e.message
  end

  private

  def make_joke_request(category)
    return Joke.find(Joke.ids.sample) unless category.presence

    choosed_category = Category.where(title: category)
    raise BadJokeRequest, 'Wrong category' if choosed_category.empty?

    Joke.where(category_id: choosed_category).sample
  end
end
