Rails.application.routes.draw do
  
  #------Creators--------
  get "/creators/new", to: "creators#new"
  post "/creators/new", to: "creators#create"


  #-------Users----------
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "/users/personalInfo", to: "users#personalInfo"
  put "/users/personalInfo", to: "users#personalInfoEdit"

  
  #-----Home Page--------
  root "outfits#index"

  
end
