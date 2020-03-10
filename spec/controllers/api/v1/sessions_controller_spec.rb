require 'rails_helper'
RSpec.describe "API V1 sessions", type: 'request' do
  describe "POST /sign_in" do
    before do
      post 'http://localhost:3000/api/v1/sign_in', params: { :user => { :email => 'admin@abc.com', :password => '12345678'} }
    end
    it "returns a status message" do
      # post('http://localhost:3000/api/v1/sign_in')
      json_response = JSON.parse(response.body)
      puts json_response
      expect(json_response['success']).to be true
    end
    it "JSON body response contains auth_token" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["auth_token", "username", "email", "success"])
    end
  end
end