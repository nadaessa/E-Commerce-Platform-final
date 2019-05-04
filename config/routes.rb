Rails.application.routes.draw do
  resources :seller
  resources :user_coupones
  resources :coupones
  resources :order_items
  resources :orders
  resources :cart_items
  resources :products
  resources :stores
  resources :categories
  resources :brands
  resources :carts do
    collection do
      get :update_quantity, :as => :update_quantity
    end   
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root :to => "home#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
