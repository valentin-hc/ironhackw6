Rails.application.routes.draw do
  root to: "products#show_all"
  devise_for :users, :path => 'accounts'

  resources :users, only: [:index] do
    resources :products, only: [:index, :new, :create, :show, :destroy]
  end
  resources :products, only: [:show, :index] do 
    resources :bids, only: [:create]
  end
end

