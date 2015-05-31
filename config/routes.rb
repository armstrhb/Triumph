Rails.application.routes.draw do
  root 'realms#index'
  get 'sessions/new'

  get 'users/index'

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'realms/activate/:id' => 'realms#activate_realm', as: 'activate_realm'
  get 'realms/deactivate/:id' => 'realms#deactivate_realm', as: 'deactivate_realm'
  resources :realms

  resources :groups
  resources :applications

  get '/users/passwd' => 'users#edit_password'
  post '/users/passwd' => 'users#update_password'
  resources :users

  get '/achievements/:realm_id' => 'achievements#index'
  get '/achievements/:realm_id/:id' => 'achievements#show'
  resources :achievements

  get '/progress/realmpoints' => 'progress#get_total_points_all_realms'
  get '/progress/realmpoints/:id' => 'progress#get_total_points_realm'
  get '/progress/userpoints/:id' => 'progress#get_total_points_for_user'
  get '/progress/userpoints/:user_id/:realm_id' => 'progress#get_total_points_for_user_in_realm'
end
