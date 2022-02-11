Rails.application.routes.draw do
  namespace :admin do
    resources :hrists
    resources :eikonas
    resources :proions

    root to: "hrists#index"
  end

  devise_for :hrists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :proions

  root "proions#index"
end
