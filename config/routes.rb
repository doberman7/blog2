Rails.application.routes.draw do
  get 'tag/index'

  get 'message/index'

  root 'message#index'

  resources :messages
  resources :tags

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
