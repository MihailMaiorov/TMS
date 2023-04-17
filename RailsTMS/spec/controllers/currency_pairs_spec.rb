require 'rails_helper'

describe CurrencyPairsController, type: :request do
  describe 'GET currency_pairs#show' do
    context 'when request ok' do
      it 'returns response status 200' do
        get currency_pairs_path

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
