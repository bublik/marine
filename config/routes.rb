require 'subdomain'
Marine::Application.routes.draw do

  constraints(Subdomain) do
    match '/' => 'admin/dashboard#index', via: :get
    #/admin/login
    # User: admin@example.com
    # Password: password
    devise_for :admin_users, ActiveAdmin::Devise.config.merge(path: "/")
    ActiveAdmin.routes(self)
  end

  root :to => "home#index"
  get '/contacts' => 'home#contacts', as: :contacts

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    member do
      get :cv, defaults: {format: 'pdf'}
    end

    collection do
      post :search
      get :enter, as: :sailor
      post :get_access
      patch :complete
      get :finish
    end
  end

  resources :personals
  resources :contacts
  resources :certificates
  resources :seaservices
  resources :langs

  # available in admin area
  # resources :languages
  # resources :vessel_engines
  # resources :vessel_types
  # resources :vessel_country_codes
  # resources :certs
  # resources :shoes
  # resources :overallsizes
  # resources :weights
  # resources :heights
  # resources :hairs
  # resources :eyes
  # resources :salaries
  # resources :positions
  # resources :maritals
  # resources :citizenships
  # resources :countries
  # resources :ranks

end