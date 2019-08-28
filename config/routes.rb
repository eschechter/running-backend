Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/signup", to: "user#create"
  post "/login", to: "auth#create"
  get "/retrieve_user", to: "auth#retrieve"

  post "/runs", to: "runs#create"
  get "/runs/:id", to: "runs#show"

  get "/users/:user_id/runs", to: "users#fetch_runs"
end
