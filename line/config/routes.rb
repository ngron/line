Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "topppages#index"
  
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :create] do
    member do 
      get :talk_list
      get :talk_room
      post :message_create
    end
  end
  
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
end
