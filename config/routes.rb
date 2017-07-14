Rails.application.routes.draw do
  resources :comments
  devise_for :users
  # devise_for :users, :controllers => { registrations: 'registrations' }
  resources :jobs
  resources :boats
  resources :photos
  root to: 'boats#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
