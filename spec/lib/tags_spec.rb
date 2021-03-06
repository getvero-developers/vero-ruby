require 'spec_helper'

describe Vero::Tags do
  before do
    Vero.auth_token = 'vero_token'
  end

  it "tag a customer with the Tags API" do
    stub_request(:post, "https://:vero_token@api.getvero.com/v2/customers/123/tags/hello").
      with(:headers => { 'Content-Type'=>'application/json' })

    Vero::Tags.add({id: 123, tag: 'hello'})
  end

  it "untag a customer with the Tags API" do
    stub_request(:delete, "https://:vero_token@api.getvero.com/v2/customers/123/tags/tag%201")

    Vero::Tags.delete({id: 123, tag: 'tag 1'})
  end

  it "list all tags with the Tags API" do
    stub_request(:get, "https://:vero_token@api.getvero.com/v2/customers/123/tags")

    Vero::Tags.all({user_id: 123})
  end
end