Starter::Application.routes.draw do
  
  match '/users/login' => 'users#login'
  match '/manager' => 'manager#index'
  match '/manager/test/:id' => 'manager#test'
  match '/manager/evaluate/:id' =>'manager#evaluate'
 

  resources :users

  resources :surveys

  root :to => 'users#index'

end
