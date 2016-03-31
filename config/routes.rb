Depot::Application.routes.draw do
  get "/store/index", to: "store/index"

  resources :products

  root to: 'store#index', as: 'store'
end
