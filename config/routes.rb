Rails.application.routes.draw do
  
  resources :okrs do
    resources :projects
  end

  root 'okrs#index'
end
