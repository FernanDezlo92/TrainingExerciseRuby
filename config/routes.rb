# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users
  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "organization#index"
  get "organization/:id" => "organization#show", as: :organization
  get "organization/:organization_id/seasons" => "season#index", as: :seasons
  get "organization/:organization_id/seasons/:id" => "season#show", as: :season
  get "organization/:organization_id/seasons/:season_id/rounds" => "round#index", as: :rounds
  get "organization/:organization_id/seasons/:season_id/rounds/:id" => "round#show", as: :round

  # root "posts#index"
end
