require 'rails_helper'

describe BooksController, type: :request do
  describe 'GET books#index' do
    context 'when request ok' do
      it 'returns response status 200' do
        get books_path

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
