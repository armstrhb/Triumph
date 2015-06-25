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
  post '/realms/changeicon/:id' => 'realms#change_icon', as: 'change_realm_icon'
  resources :realms

  get '/groups/editroster/:id' => 'groups#edit_roster', as: 'edit_group_roster'
  post '/groups/add' => 'groups#add_user', as: 'add_user_to_group'
  post '/groups/remove/:id/:user_id' => 'groups#remove_user', as: 'remove_user_from_group'
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

  get '/progress/get/:achievement_id/:user_id' => 'progress#get', as: 'get_progress'
  post '/progress/add' => 'progress#add', as: 'add_progress'
  post '/progress/subtract' => 'progress#subtract', as: 'subtract_progress'
  post '/progress/grant' => 'progress#grant', as: 'grant_progress'
  post '/progress/forfeit' => 'progress#forfeit', as: 'forfeit_progress'
  get '/progress/realmpoints' => 'progress#get_total_points_all_realms'
  get '/progress/realmpoints/:id' => 'progress#get_total_points_realm'
  get '/progress/userpoints/:id' => 'progress#get_total_points_for_user'
  get '/progress/userpoints/:user_id/:realm_id' => 'progress#get_total_points_for_user_in_realm'
  get '/progress/admin/:id' => 'progress#admin', as: 'progress_admin'
  post '/progress/search/:achievement_id' => 'progress#search', as: 'progress_user_search'

  get '/categories/:realm_id' => 'categories#index', as: 'categories'
  get '/categories/detail/:id' => 'categories#show', as: 'show_category'
  get '/categories' => 'categories#create', as: 'create_category'
  post '/categories/:id' => 'categories#update', as: 'update_category'
  delete '/categories/:id' => 'categories#destroy', as: 'destroy_category'
  resources :categories

  get '/admin' => 'admin#index', as: 'admin'
  get '/admin/sysconfig' => 'admin#show_sys_config', as: 'sys_config'
  post '/admin/updatesysconfig' => 'admin#update_sys_config', as: 'update_sys_config'

  namespace :api, defaults: { format: :json } do
    resources :realms, :only => [:index, :show]
    get '/realms/:id/users' => 'realms#users'
    get '/realms/:id/achievements' => 'realms#achievements'
    get '/realms/:id/rarities' => 'realms#rarities'
    get '/realms/:id/categories' => 'realms#categories'

    resources :achievements, :only => [:show]

    resources :users, :only => [:show]
    get '/users/:id/progress' => 'users#progress_index'
    get '/users/:id/progress/:achievement_id' => 'users#progress_show'

    post '/progress/add/:achievement/:user/:ticks' => 'progress#add'
    post '/progress/subtract/:achievement/:user/:ticks' => 'progress#subtract'
    post '/progress/grant/:achievement/:user' => 'progress#grant'
    post '/progress/forfeit/:achievement/:user' => 'progress#forfeit'

    resources :sessions, :only => [:create]
  end
end
