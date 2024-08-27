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
    get :done, on: :collection
  end

  get '/api/assessment_requests/:id/cities', to: 'assessment_requests#cities'
  get '/api/assessment_requests/:id/branches', to: 'assessment_requests#branches'
  # branch_by_name_path(name: 'tokyo')という名前付きルーティングが使えるようになる
  get 'branches/:name', to: 'branches#show', as: :branch_by_name
end
