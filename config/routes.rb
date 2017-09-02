Rails.application.routes.draw do
  get 'users/index'

  resources :tags

  get 'tags/index'

  resources :messages
  get 'messages/index'

  root 'messages#index'

#   tags GET    /tags(.:format)              tags#index
#      POST   /tags(.:format)              tags#create
# new_tag GET    /tags/new(.:format)          tags#new
# edit_tag GET    /tags/:id/edit(.:format)     tags#edit
#  tag GET    /tags/:id(.:format)          tags#show
#      PATCH  /tags/:id(.:format)          tags#update
#      PUT    /tags/:id(.:format)          tags#update
#      DELETE /tags/:id(.:format)          tags#destroy
# tags_index GET    /tags/index(.:format)        tags#index
# messages GET    /messages(.:format)          messages#index
#      POST   /messages(.:format)          messages#create
# new_message GET    /messages/new(.:format)      messages#new
# edit_message GET    /messages/:id/edit(.:format) messages#edit
# message GET    /messages/:id(.:format)      messages#show
#      PATCH  /messages/:id(.:format)      messages#update
#      PUT    /messages/:id(.:format)      messages#update
#      DELETE /messages/:id(.:format)      messages#destroy
# messages_index GET    /messages/index(.:format)    messages#index
# root GET    /                            messages#index

end
