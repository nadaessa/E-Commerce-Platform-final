Rails.application.routes.draw do
  get '/seller/confirm/:id ', to: 'seller#confirm', as: 'confirm'
  get '/seller/deliver/:id ', to: 'seller#deliver', as: 'deliver'
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
      get :do_checkout, :as => :do_checkout
      get :take_coupone_code, :as=>:take_coupone_code
    end   
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root :to => "home#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
