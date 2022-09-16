Rails.application.routes.draw do
  
  #-----Guardarobas------
  get "/guardarobas", to: "guardarobas#index", as: "guardarobas"
  post "/guardarobas", to: "guardarobas#create" 
  get "/guardarobas/:id", to: "guardarobas#show", as: "guardaroba"
  delete "/guardarobas/:id", to: "guardarobas#destroy"
  post "guardarobas/removeOutfit/:id", to: "guardarobas#removeOutfit", as:  "guardaroba_remove_outfit"

  #------Creators--------
  get "/creators/new", to: "creators#new"
  post "/creators/new", to: "creators#create"
  get  "/creators/:id", to: "creators#show", as: :creator
  post "/creators/:id", to: "creators#accept"
  delete "creators/:id", to: "creators#destroy"
  post "/creators/:id/follow", to: "creators#follow", as: "follow_creator"
  post "creators/:id/unfollow", to: "creators#unfollow", as:"unfollow_creator"
  post "creators/:id/report", to: "creators#report"

  #-------Users----------
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "/users/personalInfo", to: "users#personalInfo"
  put "/users/personalInfo", to: "users#personalInfoEdit"

  #-------Admin----------
  get "/admin", to: "admin#index"
  delete "/admin", to: "creators#destroy"

  #----------Capos-----------
  get "/capos", to: "capos#index", as: "capos"

  #----------Reports----------
  delete "/reports/:id", to: "reports#destroy", as: "report"


  #------Outfits---------
  get "/outfits/new", to: "outfits#new"
  post "/outfits/new", to: "outfits#create"
  post "/outfits/search", to: "outfits#search"
  get "/outfits/:id", to: "outfits#show", as: "show_outfit"
  post "/outfits/load", to: "outfits#load"  #Get via ajax new outfit to show on the homepage when scrolling down   
  post "outfits/renderHTML/:id", to: "outfits#renderHTML" #Get new loaded outfit html
  delete "/outfits/:id", to: "outfits#destroy"  
  post "outfits/addSavedOutfit", to: "outfits#addSavedOutfit" 

  #-----SearchBar------
  get "/search", to: "search#index"
  post "/search", to: "search#update"
  
  
  #-----Home Page--------
  root "outfits#index"

end
