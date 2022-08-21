Rails.application.routes.draw do
  
  #Creators
  get "/creators/new", to: "creators#new"
  post "/creators/new", to: "creators#create"


  #Users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  

  #Home Page
  root "outfits#index"

  
end
