module Vero
  class Events < Base
    path "/v2/events"

    def self.track(values)
      post('', values)
    end
  end
end