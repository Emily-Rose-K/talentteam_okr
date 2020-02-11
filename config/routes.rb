Rails.application.routes.draw do
  
  resources :okrs, :projects
  root 'okrs#index'
end
