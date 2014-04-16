Marine::Application.routes.draw do

  resources :seaservices

  resources :vessel_engines

  resources :vessel_types

  resources :vessel_country_codes

  resources :certificates

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :contacts
  resources :personals

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
  resources :users

end