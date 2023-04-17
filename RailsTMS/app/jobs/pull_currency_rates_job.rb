class PullCurrencyRatesJob
  include Sidekiq::Worker

  ALL_RATES = 'rates'.freeze
  RATE = 'rate'.freeze

  def perform
    all_pairs = Currencies::DataFromAPI.pairs_list

    data_to_insert = []

    all_pairs.each do |pair|
      current_pair = Currencies::DataFromAPI.current_pair(params: { pairs: pair })

      rate = current_pair.dig(ALL_RATES, pair, RATE)

      data_to_insert << { pair:, rate: }
    end

    CurrencyPair.insert_all(data_to_insert)
  end
end
