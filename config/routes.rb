Rails.application.routes.draw do
 
  resources :posts, :only=> [:show, :index] do 
  	resources :comments
  end


  namespace :admin do
  	resources :posts
  	resources :categories, :except => [:show]
  end

  root :to => "pages#index"
  get "pages/index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
