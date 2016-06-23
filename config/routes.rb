Rails.application.routes.draw do
  resources :login_bg_images

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
