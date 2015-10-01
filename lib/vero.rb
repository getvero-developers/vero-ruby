require 'nestful'
require 'vero/version'

module Vero
  def self.auth_token=(value)
    Base.auth_token = value
  end

  def self.auth_token
    Base.auth_token
  end

  def self.version=(value)
    Base.version = value
  end

  def self.version
    Base.version
  end

  autoload :Resource, 'vero/resource'
  autoload :Base, 'vero/base'
  autoload :Customers, 'vero/customers'
  autoload :Tags, 'vero/tags'
  autoload :Events, 'vero/events'

  if vero_auth_token = ENV['VERO_AUTH_TOKEN']
    Vero.auth_token = vero_auth_token
  end
end