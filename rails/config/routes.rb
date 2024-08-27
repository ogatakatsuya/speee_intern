# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :branches, only: %i[index show]
  resources :reviews, only: %i[show]
  resources :assessment_requests, only: %i[new create] do
    member do
      get :cities
    end
  end

  get '/api/assessment_requests/:id/cities', to: 'assessment_requests#cities'
end
