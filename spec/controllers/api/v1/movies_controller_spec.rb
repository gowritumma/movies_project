require 'rails_helper'
RSpec.describe "API V1 Movies", type: 'request' do

  describe "POST /movie to create movie" do
    before do
      post 'http://localhost:3000/api/v1/sign_in', params: { :user => { :email => 'admin@abc.com', :password => '12345678'} }
      json_response = JSON.parse(response.body)
      expect(json_response['success']).to be true
      auth_token = json_response['auth_token']
      post 'http://localhost:3000/api/v1/movie', params: { :movie => { :name => 'zootopia', :synopsis => 'blah blah', :preview_video_url => 'youtube.com', :runtime => 100}, :auth_token => auth_token, :genre_ids => [3,4] }
    end
      it "returns a status message" do
        expect(response).to have_http_status(:success)
      end
      it "create the movie record" do
        json_response = JSON.parse(response.body)
        expect(json_response['name']).to eql('zootopia')
        expect(json_response['synopsis']).to eql('blah blah')
        puts json_response
        expect(json_response.keys).to match_array( ["avg_score", "created_at", "genres", "id", "most_recent_scores", "name", "preview_video_url", "runtime", "synopsis", "updated_at"])
      end
    end
  describe "GET /movies - index" do
    before do
      get 'http://localhost:3000/api/v1/movies'
    end
    it "returns a status message" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected movie attributes" do
      json_response = JSON.parse(response.body)
      puts json_response
      expect(json_response[0].keys).to match_array( ["avg_score", "created_at", "genres", "id", "most_recent_scores", "name", "preview_video_url", "runtime", "synopsis", "updated_at"])
    end
  end
  describe "GET /movie - show" do
    before do
      get 'http://localhost:3000/api/v1/movie/43'
    end
    it "returns a status message" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected movie attributes" do
      json_response = JSON.parse(response.body)
      puts json_response
      expect(json_response.keys).to match_array( ["avg_score", "created_at", "genres", "id", "most_recent_scores", "name", "preview_video_url", "runtime", "synopsis", "updated_at"])
    end
  end
  describe "PUT update movie record" do
    before do
      post 'http://localhost:3000/api/v1/sign_in', params: { :user => { :email => 'admin@abc.com', :password => '12345678'} }
      json_response = JSON.parse(response.body)
      expect(json_response['success']).to be true
      auth_token = json_response['auth_token']
      put 'http://localhost:3000/api/v1/movie',  params: { :movie => { :id => 43, :name => 'Jumanji', :preview_video_url => 'youtube.com\jumanji', :runtime => 120}, :auth_token => auth_token}
    end
    it "returns a status message" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected movie attributes" do
      json_response = JSON.parse(response.body)
      puts json_response
      expect(json_response["name"]).to eql('Jumanji')
      expect(json_response["preview_video_url"]).to eql('youtube.com\jumanji')
      expect(json_response["runtime"]).to eq(120)
    end
  end
  describe "DELETE delte movie record" do
    before do
      post 'http://localhost:3000/api/v1/sign_in', params: { :user => { :email => 'admin@abc.com', :password => '12345678'} }
      json_response = JSON.parse(response.body)
      expect(json_response['success']).to be true
      auth_token = json_response['auth_token']
      delete 'http://localhost:3000/api/v1/movie',  params: { :id => 43, :auth_token => auth_token}
    end
    it "returns a status message" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response Movie deleted" do
      json_response = JSON.parse(response.body)
      puts json_response
      expect(json_response["message"]).to eql('Movie deleted')
    end

  end
end