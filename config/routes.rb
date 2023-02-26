Rails.application.routes.draw do
  get 'payment/checkout'
  resources :line_items
  resources :carts
  get 'gallery/index'
  resources :stores
  get 'admin/index'
  get 'admin/login'
  post 'admin/login'
  get 'admin/logout'
  get 'home/index'
  root 'home#index'
  get 'gallery/search'
  post 'gallery/search'
  devise_for :users
  post 'payment/checkout'
  get 'payment/puchase_complete'
  get 'home/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
