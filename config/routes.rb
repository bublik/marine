require 'subdomain'
require 'sidekiq/web'

Marine::Application.routes.draw do

  get '/orders/status/:order_id' => 'orders#status'
  match '/orders/confirm/:order' => 'orders#status', via: [:get, :post]
  resources :orders

  constraints(Subdomain) do
    match '/' => 'admin/dashboard#index', via: :get
    #/admin/login
    # User: admin@example.com
    # Password: password
    devise_for :admin_users, ActiveAdmin::Devise.config.merge(path: "/")
    ActiveAdmin.routes(self)
  end

  root :to => "home#index"
  mount Sidekiq::Web, at: '/sidekiq'

  match '/feedback' => 'home#feedback', as: :feedback, via: [:get, :post]

  devise_for :users, :controllers => {:registrations => "registrations"}

  get '/agencies' => 'users#agencies', as: 'agencies'
  get '/managers' => 'users#managers', as: 'managers'
  get '/back' => 'users#back', as: 'management'
  post '/activate_agency/:id' => 'users#activate_agency', as: 'activation'

  resources :agency_subscriptions do
    collection do
      post :migrate_data
    end
  end

  resources :users do
    member do
      get :cv, defaults: {format: 'pdf'}
      post :lock
    end

    collection do
      get :enter, as: :sailor
      post :get_access
      patch :complete
      get :finish

      post :create_manager
      post :create_seafarer

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