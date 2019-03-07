Rails.application.routes.draw do
  
  devise_for :users
  resources :projects do
  	resources :bugs do
      member do
        get 'assign_user'
        get 'bug_resolve'
      end
    end
  	member do 
  		get 'project_users'
  		get 'project_add_user'
      get 'project_remove_user'
  	end

  end
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
