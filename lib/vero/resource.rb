require 'uri'

module Vero
  class Resource
    def self.endpoint(value = nil)
      @endpoint = value if value
      return @endpoint if @endpoint
      superclass.respond_to?(:endpoint) ? superclass.endpoint : nil
    end

    def self.options(value = nil)
      @options ||= {}
      @options.merge!(value) if value

      if superclass.respond_to?(:options)
        Nestful::Helpers.deep_merge(superclass.options, @options)
      else
        @options
      end
    end

    def self.path(value = nil)
      @path = value if value
      return @path if @path
      superclass.respond_to?(:path) ? superclass.path : nil
    end

    class << self
      alias_method :endpoint=, :endpoint
      alias_method :path=, :path
      alias_method :options=, :options
      alias_method :add_options, :options
    end

    def self.url
      URI.join(endpoint.to_s, path.to_s).to_s
    end

    OPTION_KEYS = %i{
      headers params method
      proxy user password
      auth_type timeout ssl_options
      request
    }

    def self.parse_values(values)
      params  = values.reject {|k,_| OPTION_KEYS.include?(k) }
      options = values.select {|k,_| OPTION_KEYS.include?(k) }

      if request_options = options.delete(:request)
        options.merge!(request_options)
      end

      [params, options]
    end

    def self.get(action = '', values = {})
      params, options = parse_values(values)

      request(
        uri(action),
        options.merge(method: :get, params: params)
      )
    end

    def self.post(action = '', values = {})
      params, options = parse_values(values)

      request(
        uri(action),
        options.merge(method: :post, params: params, format: :json)
      )
    end

    def self.destroy(action = '', values = {})
      params, options = parse_values(values)

      request(
        uri(action),
        options.merge(method: :delete, params: params)
      )
    end

    def self.request(uri, options = {})
      options = Nestful::Helpers.deep_merge(self.options, options)

      response = Nestful::Request.new(
        uri, options
      ).execute

      response
    end

    def self.uri(*parts)
      # If an absolute URI already
      if (uri = parts.first) && uri.is_a?(URI)
        return uri if uri.host
      end

      value = Nestful::Helpers.to_path(url, *parts)

      URI.parse(value)
    end
  end
end