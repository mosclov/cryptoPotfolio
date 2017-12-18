Rails.application.routes.draw do
  resources :coins
  resources :cryptos

  root 'cryptos#index'
end
