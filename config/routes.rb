Depot::Application.routes.draw do
  resources :orders


  root to: 'store#index'
  resources :line_items
  resources :carts
  resources :products
  resources :store, only: [:index]
  match '*not_found', to: 'errors#error_404'
end
