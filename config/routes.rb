Rails.application.routes.draw do
  resources :clients do
      resources :pets do
        resources :histories
    end
  end 

  root 'clients#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
