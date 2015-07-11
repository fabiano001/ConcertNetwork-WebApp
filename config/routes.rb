Rails.application.routes.draw do

  get "/" => "concerts#index"
  resources(:concerts)
end
