Rails.application.routes.draw do
  get "/matches" => "matches#index"
  get "/matches/:faction" => "matches#show_factions"
  get "/matches/id/:player" => "matches#show_players_matches"

end
