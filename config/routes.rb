require "monban/constraints/signed_in"
Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    resource :following_relationship, only: [:create, :destroy]
  end
  resources :shouts, only: [:create]
  resources :text_subjects, only: [:create]
  resources :image_subjects, only: [:create]

   get "/sign-up", to: "users#new"
  constraints Monban::Constraints::SignedIn.new do
   get "/", to: "dashboards#show", as: :dashboard 
   resource :following, only: [:show]
   resource :followers, only: [:show]
  end
  root to: "sessions#new"
end
