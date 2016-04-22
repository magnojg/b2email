Rails.application.routes.draw do
  get 'admin' => 'admin#home'

  resources :companies
  resources :campaigns
  resources :ad_bars
  resources :ads

  root :to => "companies#index"

  devise_for :users
end
