Rails.application.routes.draw do
  get '/' => 'tournaments#index'
  get '/api/tournaments' => 'tournaments#api_index'
  post '/api/tournaments' => 'tournaments#create'
  delete '/api/tournaments' => 'tournaments#destroy'
end

