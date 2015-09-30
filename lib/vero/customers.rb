module Vero
  class Customers < Base
    path "/v2/customers"

    def self.identify(values)
      post(values)
    end
  end
end