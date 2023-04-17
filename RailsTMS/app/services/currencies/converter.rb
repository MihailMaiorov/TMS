module Currencies
  class Converter
    def self.call(pair:, amount:)
      rate = Currencies::ExchengeRates.call(pair:)

      { from: pair.first(3), to: pair.last(3), amount:, amount_to: rate.to_f * amount.to_f }
    end
  end
end
