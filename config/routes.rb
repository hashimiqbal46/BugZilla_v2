Rails.application.routes.draw do
  

 # get 'user_admin/index'
#  get 'user_admin/add_user'
  devise_for :users
  resources :projects do
  	resources :bugs
  	member do 
  		get 'project_users'
  		get 'project_add_user'
      get 'project_remove_user'
  	end
  end
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
