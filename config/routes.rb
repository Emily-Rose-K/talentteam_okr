Rails.application.routes.draw do
  
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
  

  root 'okrs#index'
end
