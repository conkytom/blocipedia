Rails.application.routes.draw do

  resources :wikis

  resources :charges



  devise_for :users

resources :users

  match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'


end
