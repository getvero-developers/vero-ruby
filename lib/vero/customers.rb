module Vero
  class Customers < Base
    path "/v2/customers"

    def self.identify(values)
      post('', values)
    end

    def self.alias(values)
      if id = values.delete(:id)
        post(uri(id, :alias), values)
      else
        raise ArgumentError, 'Invalid values'
      end
    end

    def self.unsubscribe(values)
      if id = values.delete(:id)
        post(uri(id, :unsubscribe), values)
      else
        raise ArgumentError, 'Invalid values'
      end
    end

    def self.resubscribe(values)
      if id = values.delete(:id)
        post(uri(id, :resubscribe), values)
      else
        raise ArgumentError, 'Invalid values'
      end
    end
  end
end