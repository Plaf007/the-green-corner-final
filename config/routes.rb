Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions: 'users/sessions'
}
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users

  resources :products do
    resources :reviews, only: [:new, :create]
  end

  resources :recycle_points
  resources :reviews, only: [:index, :new, :create]
  resources :addresses
  resources :selected_products
  resources :carts
  resources :orders

  get 'my_products', to: 'products#my_products'
  post "carts/update_product", to: "selected_products#update_quantity"
  post "orders/update_product", to: "selected_products#update_quantity"
  resources :carts do
    resources :payments, only: [:new, :create]
      member do
        post 'apply_discount', to: 'carts#apply_discount'
      end
  end


  post "process_payment", to: "payments#process_payment"
  resources :payments, except: [:new, :create]
end
