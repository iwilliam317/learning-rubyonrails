Rails.application.routes.draw do
  resources :categories
  resources :posts do 
  	resources :comments
  end
  
  root :to => "pages#index"
  get "pages/index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
