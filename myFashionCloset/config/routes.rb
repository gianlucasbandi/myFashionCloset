Rails.application.routes.draw do
  resources :guardarobas
  
  #------Creators--------
  get "/creators/new", to: "creators#new"
  post "/creators/new", to: "creators#create"
  get  "/creators/:id", to: "creators#show", as: :creator
  post "/creators/:id/follow", to: "creators#follow", as: "follow_creator"
  post "creators/:id/unfollow", to: "creators#unfollow", as:"unfollow_creator"
  post "creators/:id/report", to: "creators#report"

  #-------Users----------
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "/users/personalInfo", to: "users#personalInfo"
  put "/users/personalInfo", to: "users#personalInfoEdit"


  #----------Capos-----------
  resources :capos


  #------Outfits---------
  get "/outfits/new", to: "outfits#new"
  post "/outfits/new", to: "outfits#create"
  post "/outfits/search", to: "outfits#search"
  get "/outfits/:id", to: "outfits#show", as: "show_outfit"   

  #-----SearchBar------
  get "/search", to: "search#index"
  post "/search", to: "search#update"
  
  
  #-----Home Page--------
  root "outfits#index"

end
