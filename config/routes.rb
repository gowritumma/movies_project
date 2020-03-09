Rails.application.routes.draw do
  root to: "movies#index"
  resources :movies do
  	resources :scores do 
  		member do
  			get :delete
  		end
  	end
    member do
      get :delete
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # API routes
  namespace :api do
    namespace :v1 do
      get '/movies', to: "movies#index"
      get '/movie(/:id)', to: "movies#show"
      post '/movie', to: "movies#create"
      put '/movie', to: "movies#update"
      delete '/movie(/:id)', to: "movies#destroy"
      post '/movies/:movie_id/score', to: "scores#create"
      delete '/movies/:movie_id/score', to: "scores#destroy"
      devise_scope :user do
        match '/sign_in' => 'sessions#create', :via => :post
        match '/sign_out' => 'sessions#destroy', :via => :delete
      end
    end
    end
  end

