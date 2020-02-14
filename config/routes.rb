Rails.application.routes.draw do
  
  resources :okrs do
    resources :projects do
      resources :milestones
    end
  end

  root 'okrs#index'
end
