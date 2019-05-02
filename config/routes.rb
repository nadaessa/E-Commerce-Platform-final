Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :cart_items
  resources :products
  resources :stores
  resources :categories
  resources :brands
  resources :user_coupones
  resources :coupones
  resources :carts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root :to => "home#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
