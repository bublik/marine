Marine::Application.routes.draw do

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