Rails.application.routes.draw do
  get 'rarities/index'

  get 'rarities/show'

  root 'realms#index'
  get 'sessions/new'

  get 'users/index'

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'realms/activate/:id' => 'realms#activate', as: 'activate_realm'
  get 'realms/deactivate/:id' => 'realms#deactivate', as: 'deactivate_realm'
  post '/realms/rename/:id' => 'realms#rename', as: 'rename_realm'
  resources :realms

  resources :groups
  resources :applications

  get '/users/passwd' => 'users#edit_password'
  post '/users/passwd' => 'users#update_password'
  resources :users

  get '/achievements/:realm_id' => 'achievements#index', as: 'achievements'
  get '/achievements/:realm_id/:id' => 'achievements#show', as: 'show_achievement'
  resources :achievements

  get '/rarities/:id' => 'rarities#index', as: 'rarities'
  get '/rarities/detail/:id' => 'rarities#show', as: 'show_rarity'
  post '/rarities' => 'rarities#create', as: 'create_rarity'
  post '/rarities/:id' => 'rarities#update', as: 'update_rarity'
  delete '/rarities/:id' => 'rarities#destroy', as: 'destroy_rarity'
  resources :rarities

  get '/progress/realmpoints' => 'progress#get_total_points_all_realms'
  get '/progress/realmpoints/:id' => 'progress#get_total_points_realm'
  get '/progress/userpoints/:id' => 'progress#get_total_points_for_user'
  get '/progress/userpoints/:user_id/:realm_id' => 'progress#get_total_points_for_user_in_realm'
end
