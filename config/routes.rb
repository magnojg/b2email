Rails.application.routes.draw do
<<<<<<< HEAD
  resources :login_bg_images
=======
>>>>>>> 78252e70f42f6af03a335c852113b22680003ea9
  get 'test/index'

  get 'admin' => 'admin#home'

  resources :companies
  resources :campaigns
  resources :ad_bars
  resources :ads

  root :to => "companies#index"

  get 'load_campaigns' => 'application#load_campaigns', as: 'load_campaigns'
  get 'load_ad_bars' => 'application#load_ad_bars', as: 'load_ad_bars'

  devise_for :users

  mount API::Base, at: "/"
end
