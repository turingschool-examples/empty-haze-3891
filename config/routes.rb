Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "/competitions", to: "competitions#index"
get "/competitions/:id", to: "competitions#show"

get "/teams", to: "teams#index"

# resources :competitions, only: [:show, :index]

end

get "/competition", to: "competitions#index"
get "/competition/:id", to: "competitions#show"

get "/teams". to: "teams@#index"
get '/teams/new', to: 'teams#new'
get '/teams/:id', to: 'teams#show'
post '/teams', to: 'teams#create'
