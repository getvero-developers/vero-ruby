require 'spec_helper'

describe Vero::Events do
  before do
    Vero.auth_token = 'vero_token'
    Timecop.freeze(DateTime.now)
  end

  after do
    Timecop.return
  end

  it "track an event with the Events API" do
    stub_request(:post, "https://:vero_token@api.getvero.com/v2/events").
      with(:headers => { 'Content-Type'=>'application/json' })

    Vero::Events.track({user_id: 123, event: 'Purchase item', item: { sku: 'it_123' }})
  end
end