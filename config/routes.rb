Rails.application.routes.draw do

  resources :wikis

  resources :charges

  resources :collaborators, only: [:create, :edit, :new, :destroy]

  devise_for :users

resources :users

  match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'


end
