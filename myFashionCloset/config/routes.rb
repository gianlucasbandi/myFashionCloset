Rails.application.routes.draw do
  resources :capos
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root "outfits#index"

  get "/operations/top", to: "operations#top"

end
