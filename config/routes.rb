Rails.application.routes.draw do
  root 'home#index'

  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  resources :users
  resources :assignees 
    resources :okrs do
      resources :projects do
        resources :milestones do
          member do
            patch :complete
          end
        end
      end
    end
end

