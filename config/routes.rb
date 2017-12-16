Rails.application.routes.draw do
  resources :cryptos

  root 'cryptos#index'
end
