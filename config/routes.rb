Rails.application.routes.draw do
  resources :prospects
  resources :coins
  resources :cryptos

  root 'cryptos#index'
end
