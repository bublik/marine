Marine::Application.routes.draw do
  root :to => "users#enter"
  #root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    member do
      get :cv
    end

    collection do
      get :enter
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

  resources :languages
  resources :vessel_engines
  resources :vessel_types
  resources :vessel_country_codes
  resources :certs
  resources :shoes
  resources :overallsizes
  resources :weights
  resources :heights
  resources :hairs
  resources :eyes
  resources :salaries
  resources :positions
  resources :maritals
  resources :citizenships
  resources :countries
  resources :ranks

end