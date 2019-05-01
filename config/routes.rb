Rails.application.routes.draw do
  resources :stores
  resources :categories
  resources :brands
  resources :user_coupones
  resources :coupones
  resources :orders
  resources :states
  resources :carts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
