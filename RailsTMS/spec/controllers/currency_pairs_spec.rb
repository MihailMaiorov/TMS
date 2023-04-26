require 'rails_helper'

describe CurrencyPairsController, type: :request do
  describe 'GET /currency_pairs' do
    it 'returns a successful response' do
      get currency_pairs_path

      expect(response).to have_http_status(:ok)
    end
  end
end
