# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'branches#index'

  resources :branches, only: %i[index show] do
    collection do
      get :result
    end
  end
  resources :reviews, only: %i[show]
  resources :assessment_requests, only: %i[new create] do
    get :done, on: :collection
  end
  resources :area_filtering, only: %i[create]

  get '/api/:id/cities', to: 'shared_api#cities'
  get '/api/assessment_requests/:id/branches', to: 'assessment_requests#branches'
  # branch_by_name_path(id: 1, name: 'tokyo')という名前付きルーティングが使えるようになる
  get 'branches/:id/:name', to: 'branches#show', as: :branch_by_name
end
