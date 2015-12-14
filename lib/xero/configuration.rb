module Xero
  class Configuration

    INVOICE_DUE_DAYS = 30.freeze
    API_HOST = 'https://api.xero.com'.freeze

    attr_accessor :logger, :consumer_key, :consumer_secret, :private_key_path,
      :invoice_due_days, :ca_file, :api_host

    def initialize(options = {})
      attributes = {
        invoice_due_days: INVOICE_DUE_DAYS,
        api_host:         API_HOST,
        logger:           Logger.new(STDOUT)
      }.merge!(options)

      attributes.each { |key, value| self.send("#{key}=", value) }
    end
  end
end
