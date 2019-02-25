Rails.application.routes.draw do
  
  get 'user_admin/index'
  devise_for :users
  resources :projects do
  	resources :bugs
  end
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
