Rails.application.routes.draw do

  get "/competitions", to: "competitions#index"
  get "/competitions/:competition_id", to: "competitions#show"
end
