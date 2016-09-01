Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :planes
  resources :hours
  resources :plane_registrations

  root 'static_pages#unauthenticated'
end
