module Currencies
  class Converter
    class EmptyParams < StandardError; end

    def self.call(pair:, amount:)
      raise EmptyParams, 'Missing currency pair' unless pair.present?

      rate = Currencies::ExchengeRates.call(pair:)
      from = pair.first(3)
      to = pair.last(3)

      { from:, to:, amount:, amount_to: rate.to_f * amount.to_f }
    end
  end
end
