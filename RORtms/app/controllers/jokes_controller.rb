class JokesController < ApplicationController
  class BadJokeRequest < StandardError; end

  def random
    @random_joke = make_random_joke_request

    render json: @random_joke
  rescue BadJokeRequest => e
    render json: e.message
  end

  def categories
    @categories = Category.pluck(:title)

    render json: @categories
  end

  def search
    @search_request = make_search_request

    render json: @search_request
  rescue BadJokeRequest => e
    render json: e.message
  end

  private

  def make_random_joke_request
    joke = Joke
    joke = joke.where(category_id: Category.where(title: params[:category])) if params[:category]
    joke = joke.order('RANDOM()').first
  end

  def make_search_request
    raise BadJokeRequest, 'Query must be minimum 3 letters' if params[:query].nil? || params[:query].size < 3

    search_request = Joke.where('body LIKE ?', "%#{params[:query]}%")

    { 'total' => search_request.size, 'result' => search_request }
  end
end
