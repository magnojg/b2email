Rails.application.routes.draw do
  get 'admin' => 'admin#home'

  namespace :admin do
    resources :companies
    resources :campaigns
    resources :ad_bars
    resources :ads
  end

  root :to => "companies#index"

  devise_for :users
end
