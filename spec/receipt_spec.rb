require_relative 'spec_helper'
require 'rack/test'
set :environment, :test

def app
  Sinatra::Application
end
describe 'Receipt Service' do
  include Rack::Test::Methods
  it "should load the recent purchases" do
    get '/'
    expect(last_response).to be_ok
  end
  it "load the first receipt" do
    get '/receipts', {:id => '1'}
    expect(last_response).to be_ok
  end
end
