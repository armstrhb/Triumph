Rails.application.routes.draw do
  resources :realms
  resources :groups
  resources :applications

  get '/progress/realmpoints' => 'progress#get_total_points_all_realms'
  get '/progress/realmpoints/:id' => 'progress#get_total_points_realm'
  get '/progress/userpoints/:id' => 'progress#get_total_points_for_user'
  get '/progress/userpoints/:user_id/:realm_id' => 'progress#get_total_points_for_user_in_realm'
end
