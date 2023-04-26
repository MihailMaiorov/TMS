class CurrencyPairsController < ApplicationController
  rescue_from Currencies::Requester::ServiceUnavailable do
    render json: { errors: 'Service unavailable' }, status: :service_unavailable
  end

  rescue_from Currencies::ExchengeRates::BadParams do |e|
    render json: { errors: e.message }, status: :bad_request
  end

  rescue_from Currencies::Converter::EmptyParams do |e|
    render json: { errors: e.message }, status: :bad_request
  end

  def show
    render json: Currencies::Requester.call
  end

  def convert
    render json: Currencies::Converter.call(pair: params[:pairs], amount: params[:amount])
  end
end
