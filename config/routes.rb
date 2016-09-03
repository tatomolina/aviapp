Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :planes
  resources :hours
  resources :plane_registrations

  authenticated :user do
    #root 'root_assignment#assign_root', as: :authenticated_root
  end

  root 'static_pages#unauthenticated'
end
