Starter::Application.routes.draw do
  
  match '/users/login' => 'users#login'
  match '/users/logout' => 'users#logout'
  match '/content' => 'content#index'
  match '/content/assign' => 'content#assign'
  match '/content/test/:id' => 'content#test'
  match '/content/evaluate/:id' =>'content#evaluate'
 
  resources :users
  resources :surveys 
 
root :to => "users#index"
end
