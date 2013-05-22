ToolShare::Application.routes.draw do

  resources :users
  resources :tools

  root :to => "static#index"
  match '/signup', :to=> 'users#new'
end