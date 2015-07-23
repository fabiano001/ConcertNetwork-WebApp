Rails.application.routes.draw do

  resources :users
  resources(:concerts)

  get "/" => "concerts#index" # shows all concerts,same as /concerts

  get "/today" => "concerts#today" # shows today's concerts

  get "/thismonth" => "concerts#this_month" # shows today's concerts

  get "/featured" => "concerts#featured" # shows featured concerts

  get "/signup" => "users#new" # form to allow a user to sign up
  post "/signup" => "users#create" # post to crete new user

  get '/login' => 'sessions#new' # displays login form
	post '/login' => 'sessions#create' # log in
	delete '/logout' => 'sessions#destroy'# log out

end
