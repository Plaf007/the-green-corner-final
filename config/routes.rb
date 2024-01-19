Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions: 'users/sessions'
}
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resources :addresses, only: [:index, :new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :products do
    resources :reviews, only: [:new, :create]
  end

  resources :orders do
    resources :selected_products, only: [:index, :new, :create]
  end

  resources :recycle_points
  resources :reviews, only: [:index, :new, :create]
  resources :addresses
  resources :selected_products
  resources :carts
  resources :orders

  post "carts/update_product", to: "selected_products#update_quantity"
  post "orders/update_product", to: "selected_products#update_quantity"
  resources :carts do
    member do
      post 'apply_discount', to: 'carts#apply_discount'
    end
  end
end
