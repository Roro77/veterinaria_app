Rails.application.routes.draw do
  resources :pets do
    resources :histories
  end

  root 'pets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
