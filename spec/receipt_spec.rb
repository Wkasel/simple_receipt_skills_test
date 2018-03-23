require File.expand_path '../spec_helper.rb', __FILE__
require 'rack/test'
set :environment, :test

def app
  Sinatra::Application
end
describe 'Receipt Service' do
  include Rack::Test::Methods
  it "should calculate the sales tax, import tax, and excempt items" do
    get '/'
    expect(last_response).to be_ok
  end
end
