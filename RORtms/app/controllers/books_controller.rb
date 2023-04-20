class BooksController < ApplicationController
  def index
    render json: Filtered::Books.call(filtered_params)
  end

  private

  def filtered_params
    params.permit(:title, :price, :views)
  end
end
