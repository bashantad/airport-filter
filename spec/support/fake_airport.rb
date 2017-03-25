# spec/support/fake_airport.rb
require 'sinatra/base'

class FakeAirport < Sinatra::Base
  get '/api/airports' do
    json_response 200, 'airports.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end