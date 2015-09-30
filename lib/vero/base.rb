module Vero
  class Base < Resource
    endpoint "https://api.getvero.com/"
    options format: :json

    def self.auth_token=(value)
      options auth_type: :basic, password: value
      @auth_token = value
    end

    def self.auth_token
      @auth_token
    end

    def self.version=(value)
      @version = value
    end

    def self.version
      @version
    end
  end
end