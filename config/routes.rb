Marine::Application.routes.draw do
  resources :maritals

  resources :citizenships

  resources :countries

  resources :ranks

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end