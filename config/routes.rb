Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/sign-up", to: "users#create"
  post "/login", to: "auth#create"
  get "/retrieve-user", to: "auth#retrieve"

  post "/runs", to: "runs#create"
  get "/runs/:id", to: "runs#show"
  patch "/runs/:id", to: "runs#update"

  get "/users/:user_id/runs", to: "users#fetch_runs"
  get "/users/:user_id/search/:search_term", to: "users#search"

  get "/users/:user_id/friends", to: "users#fetch_friends"
  get "/users/:user_id/request-senders", to: "users#fetch_request_senders"
  get "/users/:user_id/request-receivers", to: "users#fetch_request_receivers"

  post "/users/request/:request_sender_id/:request_receiver_id", to: "users#request_friend"
  post "/users/complete_request/:request_sender_id/:request_receiver_id", to: "request#complete_request"
end
