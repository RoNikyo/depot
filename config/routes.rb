Depot::Application.routes.draw do
  resources :products
  resources :store, only: [:index]

  root to: 'store#index', as: 'store'
end
