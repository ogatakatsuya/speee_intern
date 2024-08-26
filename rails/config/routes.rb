# frozen_string_literal: true

Rails.application.routes.draw do
  get 'assessment_requests/new'
  get 'assessment_requests/create'
  mount KomachiHeartbeat::Engine => '/ops'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :branches, only: %i[index show]
  resources :reviews, only: %i[show]
  resources :assessment_requests, only: %i[new create]
end
