module Currencies
  class ExchengeRates
    class BadParams < StandardError; end

    ALL_RATES = 'rates'.freeze
    RATE = 'rate'.freeze
    STATUS = 'code'.freeze
    MESSAGE = 'message'.freeze
    UPDATE_CONDITION = 1.minutes.ago

    class << self
      def call(pair:)
        if actual_rates?(pair:)
          get_rate_from_db(pair:)
        else
          rate = rate_from_api(pair:)
          add_to_db(pair:, rate:)
        end.rate
      end

      private

      def actual_rates?(pair:)
        CurrencyPair.where(pair:).where('updated_at > ?', UPDATE_CONDITION).exists?
      end

      def get_rate_from_db(pair:)
        CurrencyPair.where(pair:).last
      end

      def rate_from_api(pair:)
        response_body = Requester.call(params: { pairs: pair })
        raise BadParams, response_body[MESSAGE] unless response_body[STATUS] == 200

        response_body.dig(ALL_RATES, pair, RATE)
      end

      def add_to_db(pair:, rate:)
        CurrencyPair.create!(pair:, rate:)
      end
    end
  end
end
