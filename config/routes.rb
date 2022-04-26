Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "/competitions", to: "competitions#index"
get "/competitions/:id", to: "competitions#show"

get "/teams", to: "teams#index"

# resources :competitions, only: [:show, :index]

end
