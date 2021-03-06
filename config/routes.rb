# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :hrists
    resources :eikonas
    resources :proions
    resources :tags
    resources :tagged_products

    root to: 'hrists#index'
  end

  devise_for :hrists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :proions

  root 'proions#index'
end
