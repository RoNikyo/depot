Depot::Application.routes.draw do
  resources :line_items


  resources :carts


  resources :products
  resources :store, only: [:index]

  root to: 'store#index', as: 'store'
end
