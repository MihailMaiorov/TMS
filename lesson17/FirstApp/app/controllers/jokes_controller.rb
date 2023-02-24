require 'curb'

class JokesController < ApplicationController
  def random
    @jokes = %w[first_joke second_joke].sample
  end

  def chuck
    response = Curl.get 'https://api.chucknorris.io/jokes/random'

    render json: JSON(response.body)['value']
  end
end
