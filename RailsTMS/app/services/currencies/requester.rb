module Currencies
  class Requester
    class ServiceUnavailable < StandardError; end

    HOST = 'https://www.freeforexapi.com/'.freeze
    PAIRS_LIST_PATH = '/api/live'.freeze
    SUPPORTED_PAIRS = 'supportedPairs'.freeze

    class << self
      def call(params: {})
        return make_request(params:) if params.present?

        make_request[SUPPORTED_PAIRS]
      end

      private

      def make_request(params: {})
        request = Curl.urlalize(File.join(HOST, PAIRS_LIST_PATH), params)
        response = Curl.get(request)

        raise ServiceUnavailable unless response.response_code == 200

        JSON(response.body)
      end
    end
  end
end
