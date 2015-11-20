Rails.application.routes.draw do
  devise_for :users
  root 'barbecues#index'
  get '/api/barbecues/:id' => 'barbecues#api_show'
  post 'api/barbecues/:id/join' => 'barbecues#api_add_users'

  resources :barbecues, only: [ :index, :show, :new, :create ] do
  	resources :items, only: [:new, :create]
  end
end
