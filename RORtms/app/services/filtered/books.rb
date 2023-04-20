module Filtered
  class Books
    def self.call(filtered_params)
      books = Book
      books = books.where('title LIKE ?', "%#{filtered_params[:title]}%") if filtered_params[:title]
      books = books.where('price >= ?', filtered_params[:price]) if filtered_params[:price]
      books = books.where('views >= ?', filtered_params[:views]) if filtered_params[:views]
      books.order(:id)
    end
  end
end
