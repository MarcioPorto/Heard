# == Route Map
#
#               Prefix Verb   URI Pattern                           Controller#Action
#                 root GET    /                                     reports#index
#              answers GET    /answers(.:format)                    answers#index
#                      POST   /answers(.:format)                    answers#create
#           new_answer GET    /answers/new(.:format)                answers#new
#          edit_answer GET    /answers/:id/edit(.:format)           answers#edit
#               answer GET    /answers/:id(.:format)                answers#show
#                      PATCH  /answers/:id(.:format)                answers#update
#                      PUT    /answers/:id(.:format)                answers#update
#                      DELETE /answers/:id(.:format)                answers#destroy
#    blocked_addresses GET    /blocked_addresses(.:format)          blocked_addresses#index
#                      POST   /blocked_addresses(.:format)          blocked_addresses#create
#  new_blocked_address GET    /blocked_addresses/new(.:format)      blocked_addresses#new
# edit_blocked_address GET    /blocked_addresses/:id/edit(.:format) blocked_addresses#edit
#      blocked_address GET    /blocked_addresses/:id(.:format)      blocked_addresses#show
#                      PATCH  /blocked_addresses/:id(.:format)      blocked_addresses#update
#                      PUT    /blocked_addresses/:id(.:format)      blocked_addresses#update
#                      DELETE /blocked_addresses/:id(.:format)      blocked_addresses#destroy
#              reports GET    /reports(.:format)                    reports#index
#                      POST   /reports(.:format)                    reports#create
#           new_report GET    /reports/new(.:format)                reports#new
#          edit_report GET    /reports/:id/edit(.:format)           reports#edit
#               report GET    /reports/:id(.:format)                reports#show
#                      PATCH  /reports/:id(.:format)                reports#update
#                      PUT    /reports/:id(.:format)                reports#update
#                      DELETE /reports/:id(.:format)                reports#destroy
#           categories GET    /categories(.:format)                 categories#index
#                      POST   /categories(.:format)                 categories#create
#         new_category GET    /categories/new(.:format)             categories#new
#        edit_category GET    /categories/:id/edit(.:format)        categories#edit
#             category GET    /categories/:id(.:format)             categories#show
#                      PATCH  /categories/:id(.:format)             categories#update
#                      PUT    /categories/:id(.:format)             categories#update
#                      DELETE /categories/:id(.:format)             categories#destroy
#

Rails.application.routes.draw do
  root 'reports#index'
  resources :answers
  resources :blocked_addresses
  resources :reports
  resources :categories
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
