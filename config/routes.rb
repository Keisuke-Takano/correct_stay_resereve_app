Rails.application.routes.draw do
  
  get "posts/index" => "posts#index"
  get "posts/tokyo" => "posts#index_tokyo"
  get "posts/oosaka" => "posts#index_oosaka"
  get "posts/kyoto" => "posts#index_kyoto"
  get "posts/sapporo" => "posts#index_sapporo"

  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/search" => "posts#search"
  get "posts/register" => "posts#register"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update"=> "posts#update"

  post "/reservations/:post_id/create" => "reservations#create"
  get "/reservations/confirm" => "reservations#confirm"
  
  get "users/profile" => "users#profile"
  post "users/update_2" => "users#update_2"
  get "users/edit" => "users#edit"
  get "users/account" => "users/account"
  post "users/update" => "users#update"
  get "users/:id/index" => "users#reserve_index"

  post "logout" => "users#logout"
  get "login" => "users#login_form"
  post "login" => "users#login"

  get "signup" => "users#new"
  post "users/create" => "users#create"

  get "/" => "home#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
