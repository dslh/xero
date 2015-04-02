module Xero
  class Connection

    attr_accessor :client, :consumer_options

    def initialize(options = {})
      self.consumer_options = {
        site: 'https://api.xero.com',
        request_token_path: '/oauth/RequestToken',
        access_token_path: '/oauth/AccessToken',
        authorize_path: '/oauth/Authorize',
        ca_file: Xero.configuration.ca_file
      }.reverse_merge(options)
    end

    def consumer
      @consumer ||= ::OAuth::Consumer.new(
        Xero.configuration.consumer_key, Xero.configuration.consumer_secret,
        self.consumer_options
      )
    end

    def access_token
      @access_token ||= ::OAuth::AccessToken.new(
        consumer, Xero.configuration.consumer_key,
        Xero.configuration.consumer_secret
      )
    end

    def get_by_id(path, id)
      make_request(:get, "#{path}/#{id}")
    end

    def get(path, params = {})
      path = "#{path}?#{params.to_query}" unless params.blank?
      make_request(:get, path)
    end

    def post(path, payload, params = {})
      make_request(:post, path, { xml: payload })
    end

    private

    def make_request(method, path, params = {})
      uri = "#{Xero.configuration.xero_url}/#{path}"

      headers = { 'charset' => 'utf-8' }

      Xero.configuration.logger.debug(
        "XERO::Connection #{method.upcase} #{uri} with #{params}"
      )

      if method == :get
        response = access_token.get(uri, params)
      else
        response = access_token.post(uri, params, headers)
      end

      Xero.configuration.logger.debug(
        "XERO::Connection RESPONSE code: #{response} body: #{response.body}"
      )

      handle_response(params, response)
    end

    def handle_response(request, response)
      if response.code.to_i == 200
        response
      else
        handle_error(request, response)
      end
    end

    def handle_error(request, response)
      case response.code.to_i
      when 400
        raise Xero::Errors::BadRequest.new(request, response.body)
      end
    end
  end
end
