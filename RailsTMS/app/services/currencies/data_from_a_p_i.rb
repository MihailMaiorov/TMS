module Currencies
  class DataFromAPI
    class ServiceUnavailable < StandardError; end

    HOST = 'https://www.freeforexapi.com/'.freeze
    PAIRS_LIST_PATH = '/api/live'.freeze
    SUPPORTED_PAIRS = 'supportedPairs'.freeze

    class << self
      def pairs_list
        make_request(path: PAIRS_LIST_PATH)[SUPPORTED_PAIRS]
      end

      def current_pair(params: {})
        make_request(path: PAIRS_LIST_PATH, params:)
      end

      private

      def make_request(path:, params: {})
        request = Curl.urlalize(File.join(HOST, path), params)
        response = Curl.get(request)

        raise ServiceUnavailable unless response.response_code == 200

        JSON(response.body)
      end
    end
  end
end
