require 'spec_helper'

describe Vero::Customers do
  before do
    Vero.auth_token = 'vero_token'
  end

  it "identify a customer with the Customers API" do
    stub_request(:post, "https://:vero_token@api.getvero.com/v2/customers").
      with(:headers => { 'Content-Type'=>'application/json' })

    Vero::Customers.identify({id: 123, email: 'damienb@getvero.com'})
  end

  it "alias a customer with the Customers API" do
    stub_request(:post, "https://:vero_token@api.getvero.com/v2/customers/123/alias").
      with(:headers => { 'Content-Type'=>'application/json' })

    Vero::Customers.alias({id: 123, new_id: 'damienb@getvero.com'})
  end

  it "unsubscribe a customer with the Customers API" do
    stub_request(:post, "https://:vero_token@api.getvero.com/v2/customers/123/unsubscribe").
      with(:headers => { 'Content-Type'=>'application/json' })

    Vero::Customers.unsubscribe({id: 123})
  end

  it "resubscribe a customer with the Customers API" do
    stub_request(:post, "https://:vero_token@api.getvero.com/v2/customers/123/resubscribe").
      with(:headers => { 'Content-Type'=>'application/json' })

    Vero::Customers.resubscribe({id: 123})
  end
end