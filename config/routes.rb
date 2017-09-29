Rails.application.routes.draw do
  get 'tweets/index'

  get 'tweets/show'

  get 'tweets/edit'

  get 'tweets/update'

  get 'tweets/destroy'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
