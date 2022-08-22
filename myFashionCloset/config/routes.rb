Rails.application.routes.draw do
  
  #------Creators--------
  get "/creators/new", to: "creators#new"
  post "/creators/new", to: "creators#create"
  get  "/creators/:id", to: "creators#show", as: :creator
  

  #-------Users----------
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "/users/personalInfo", to: "users#personalInfo"
  put "/users/personalInfo", to: "users#personalInfoEdit"

  
  #-----SearchBar------
  get "/search", to: "search#index"
  
  #-----Home Page--------
  root "outfits#index"

  
end
