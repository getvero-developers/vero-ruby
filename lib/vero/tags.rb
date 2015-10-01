module Vero
  class Tags < Base
    options format: :json
    path "/v2/customers"

    def self.add(values)
      if (id = values.delete(:id)) && (tag = values.delete(:tag))
        post(uri(id, :tags, tag), values)
      else
        raise ArgumentError, 'Invalid values'
      end
    end

    def self.delete(values)
      if (id = values.delete(:id)) && (tag = values.delete(:tag))
        destroy(uri(id, :tags, URI.escape(tag)), values)
      else
        raise ArgumentError, 'Invalid values'
      end
    end

    def self.all(values)
      path "/v2/customers"

      if id = values.delete(:user_id)
        get(uri(id, :tags), values)
      else
        raise ArgumentError, 'Invalid values'
      end
    end
  end
end