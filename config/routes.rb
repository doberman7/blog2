Rails.application.routes.draw do
  post '/users/new'

  get 'users/index'
  get 'messages/index'

  root 'users#index'
  get 'tags/index'


  resources :users
  resources :tags
  resources :messages
      #   Prefix Verb   URI Pattern                  Controller#Action
      # users_index GET    /users/index(.:format)       users#index
      # messages_index GET    /messages/index(.:format)    messages#index
      #   root GET    /                            users#index
      # tags_index GET    /tags/index(.:format)        tags#index
      #  users GET    /users(.:format)             users#index
      #        POST   /users(.:format)             users#create
      # new_user GET    /users/new(.:format)         users#new
      # edit_user GET    /users/:id/edit(.:format)    users#edit
      #   user GET    /users/:id(.:format)         users#show
      #        PATCH  /users/:id(.:format)         users#update
      #        PUT    /users/:id(.:format)         users#update
      #        DELETE /users/:id(.:format)         users#destroy
      #   tags GET    /tags(.:format)              tags#index
      #        POST   /tags(.:format)              tags#create
      # new_tag GET    /tags/new(.:format)          tags#new
      # edit_tag GET    /tags/:id/edit(.:format)     tags#edit
      #    tag GET    /tags/:id(.:format)          tags#show
      #        PATCH  /tags/:id(.:format)          tags#update
      #        PUT    /tags/:id(.:format)          tags#update
      #        DELETE /tags/:id(.:format)          tags#destroy
      # messages GET    /messages(.:format)          messages#index
      #        POST   /messages(.:format)          messages#create
      # new_message GET    /messages/new(.:format)      messages#new
      # edit_message GET    /messages/:id/edit(.:format) messages#edit
      # message GET    /messages/:id(.:format)      messages#show
      #        PATCH  /messages/:id(.:format)      messages#update
      #        PUT    /messages/:id(.:format)      messages#update
      #        DELETE /messages/:id(.:format)      messages#destroy

end
