require 'rails_helper'

describe CurrencyPairsController, type: :request do
  let(:valid_params) { { pairs: 'EURUSD', amoumt: 100 } }
  let(:invalid_params) { { pairs: 'EURUS', amount: 100 } }

  describe 'GET /currency_pairs' do
    it 'returns a successful response' do
      get currency_pairs_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /currency_pairs/convert' do
    context 'with valid parameters' do
      it 'returns a successful response' do
        get convert_currency_pairs_path(valid_params)

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'returns a response with 400 status' do
        get convert_currency_pairs_path

        expect(response).to have_http_status(:bad_request)
      end

      it 'returns a response with 400 status' do
        get convert_currency_pairs_path(invalid_params)

        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
