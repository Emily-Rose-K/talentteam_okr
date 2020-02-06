Rails.application.routes.draw do
  
  resources :okrs 
  root 'okrs#index'
end
