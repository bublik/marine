require 'subdomain'
require 'sidekiq/web'

Marine::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
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

  # authenticated :user, ->(u) { u.user? } do
  #   root to: 'registrations#edit', as: :user_root
  # end

  root :to => "home#index"
  mount Sidekiq::Web, at: '/sidekiq'

  resources :vacancies do
    member do
      post :send_request
    end
  end
  match '/feedback' => 'home#feedback', as: :feedback, via: [:get, :post]
  match '/job' => 'home#vacancies', as: :job, via: [:get]

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
      get :invite
      post :send_invitation
      get '/enter(/:token)' => 'users#enter', as: :sailor
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
  resources :certificates do
    collection do
      get :expired_certs, as: :expired_certs
    end
  end
  resources :seaservices
  resources :langs

  resources :pages, only: [:index, :new, :create, :edit]
  resources :pages, path: "", except: [:index, :new, :create]
  get '/rails/mailers' => "rails/mailers#index"
  get '/rails/mailers/*path' => "rails/mailers#preview"

  get '*id', to: 'pages#show'
end