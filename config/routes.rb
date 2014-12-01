Rails.application.routes.draw do

  resources :articles do
    resources :comments
  end

  resources :users

  get 'welcome/index'
  root 'articles#index'
end
