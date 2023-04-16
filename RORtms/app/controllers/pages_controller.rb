class PagesController < ApplicationController
  def index
    @name = params[:name]

    render json: @name
  end
end
