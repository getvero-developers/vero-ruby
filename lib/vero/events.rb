module Vero
  class Events < Base
    path "/v2/events"

    def self.track(values)
      post('', values)
    end

    def self.all(values)
      path "/v2/customers"

      if id = values.delete(:user_id)
        get(uri(id, :events), values)
      else
        raise ArgumentError, 'Invalid values'
      end
    end
  end
end