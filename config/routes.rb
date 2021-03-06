Rails.application.routes.draw do
  get 'home/show'

 get   '/login', :to => 'sessions#new', :as => :login
 get '/auth/google_oauth2/callback', :to => 'sessions#create'
 
  resource :home, only: [:show]

  root to: "sessions#new"



get "/signout" => "sessions#destroy", :as => :signout


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
