Rails.application.routes.draw do
  get 'pages/home'

  resources :tweets, only: [:index, :show, :edit, :update, :destroy]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
