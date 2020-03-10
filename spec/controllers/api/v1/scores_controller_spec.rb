require 'rails_helper'
RSpec.describe "API V1 Movies", type: 'request' do

  describe "POST /score to a movie" do
    before do
      post 'http://localhost:3000/api/v1/sign_in', params: { :user => { :email => 'admin@abc.com', :password => '12345678'} }
      json_response = JSON.parse(response.body)
      expect(json_response['success']).to be true
      auth_token = json_response['auth_token']
      post 'http://localhost:3000/api/v1/movies/43/score', params: { :score => 80, :auth_token => auth_token }
    end
      it "returns a status message" do
        expect(response).to have_http_status(:success)
      end
      it "create new score for the movie" do
        json_response = JSON.parse(response.body)
        # expect(json_response['message']).to eql('New score created')
        expect(json_response['message']).to eql('Score updated').or eql('New score created')
      end
  end
  describe "DELETE /score of a movie" do
    before do
      post 'http://localhost:3000/api/v1/sign_in', params: { :user => { :email => 'admin@abc.com', :password => '12345678'} }
      json_response = JSON.parse(response.body)
      expect(json_response['success']).to be true
      auth_token = json_response['auth_token']
      delete 'http://localhost:3000/api/v1/movies/43/score', params: { :auth_token => auth_token }
    end
    it "returns a status message" do
      expect(response).to have_http_status(:success)
    end
    it "create new score for the movie" do
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eql('Score deleted successfully.')
    end
  end
end