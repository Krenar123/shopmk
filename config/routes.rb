# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :hrists
    resources :eikonas
    resources :proions
    resources :categories
    resources :orders
    resources :riders
    resources :deliveries
    resources :tags
    resources :tagged_products

    root to: 'hrists#index'
  end

  devise_for :hrists

  scope "(:locale)", locale: /mk|sq/ do
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }
    devise_for :riders, controllers: {
      registrations: 'riders/registrations',
      sessions: 'riders/sessions'
    }

    get 'riders/:id' => 'riders#show', as: 'rider'


    resources :proions, path: 'products'
    resources :categories, key: :reference
    resources :orders
    resources :deliveries
    resources :locations

    get 'carts/cart_checkout' => 'carts#cart_checkout', as: 'cart_checkout'
    get 'carts/:id' => 'carts#show', as: 'cart'
    delete 'carts/:id' => 'carts#destroy'

    post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
    post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
    post 'line_items' => 'line_items#create'
    get 'line_items/:id' => 'line_items#show', as: 'line_item'
    delete 'line_items/:id' => 'line_items#destroy'

    post '/navigate-category', to: 'categories#navigate_category'
    get '/shop', to: 'pages#shop', as: :shop
    root 'pages#index', as: :pages_index
  end
end
