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

  get '/icons' => 'icons#index', as: 'icons'
  get '/icons/search/:name' => 'icons#searach', as: 'icons_search'

  get 'realms/activate/:id' => 'realms#activate', as: 'activate_realm'
  get 'realms/deactivate/:id' => 'realms#deactivate', as: 'deactivate_realm'
  post '/realms/rename/:id' => 'realms#rename', as: 'rename_realm'
  resources :realms

  resources :groups
  resources :applications

  get '/users/passwd' => 'users#edit_password'
  post '/users/passwd' => 'users#update_password'
  get '/users/realm/:id' => 'users#index_for_realm', as: 'realm_users'
  get '/users/realm/edit/:id' => 'users#edit_realm_users', as: 'edit_realm_users'
  post '/users/search' => 'users#search', as: 'user_search'
  post '/users/add' => 'users#add_to_realm', as: 'add_user_to_realm'
  post '/users/remove' => 'users#remove_from_realm', as: 'remove_user_from_realm'
  resources :users

  get '/achievements/:realm_id' => 'achievements#index', as: 'achievements'
  get '/achievements/:realm_id/:id' => 'achievements#show', as: 'show_achievement'
  post '/achievements/:realm_id' => 'achievements#create', as: 'create_achievement'
  delete '/achievements/:id' => 'achievements#destroy', as: 'destroy_achievement'
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

  get '/categories/:realm_id' => 'categories#index', as: 'categories'
  get '/categories/detail/:id' => 'categories#show', as: 'show_category'
  get '/categories' => 'categories#create', as: 'create_category'
  resources :categories

end
