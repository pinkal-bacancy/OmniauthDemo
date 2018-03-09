Rails.application.routes.draw do
  get 'home/show'

 get   '/login', :to => 'sessions#new', :as => :login
 get '/auth/google_oauth2/callback', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'
  resource :home, only: [:show]

  root to: "home#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
