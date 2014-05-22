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

  get '/agencies' => 'users#agencies', as: 'agencies'
  get '/managers' => 'users#managers', as: 'managers'
  post '/activate_agency/:id' => 'users#activate_agency', as: 'activation'

  resources :users do
    member do
      get :cv, defaults: {format: 'pdf'}
      post :lock
    end

    collection do
      post :search
      get :enter, as: :sailor
      post :get_access
      patch :complete
      get :finish

      post :create_manager

      get :crewing, as: :crewing
      post :create_crewing
    end
  end

  resources :personals
  resources :contacts
  resources :certificates
  resources :seaservices
  resources :langs

end