Rails.application.routes.draw do
  resources :capos
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "/users/personalInfo", to: "users#personalInfo"
  put "/users/personalInfo", to: "users#personalInfoEdit"

  
  #-----Home Page--------
  root "outfits#index"

end
