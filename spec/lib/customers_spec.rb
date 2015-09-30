require 'spec_helper'

describe Vero::Customers do
  before do
    Vero.auth_token = 'vero_token'
    Timecop.freeze(DateTime.now)
  end

  after do
    Timecop.return
  end

  it "identify a customer with the Events API" do
    stub_request(:post, "https://:vero_token@api.getvero.com/v2/customers").
      with(:headers => { 'Content-Type'=>'application/json' })

    Vero::Customers.identify({id: 123, email: 'damienb@getvero.com'})
  end
end