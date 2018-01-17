Rails.application.routes.draw do
  get 'users/show'

  get 'users/index'
  get "users/:id" => "users#show"

  get "/signup" => "users#new"
  post "users/create" => "users#create"
  post "users/:id/update" => "users#update"

  get "users/:id/edit" => "users#edit"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  get "/" => "home#top"
  get "about" => "home#about"
end