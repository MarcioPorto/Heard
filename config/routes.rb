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
require 'api_constraints'

Rails.application.routes.draw do
  # API definition
  namespace :api, defaults: { format: :json } do
    # The constraints are setting the default API version to 1
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :answers, only: [:index, :show, :create, :update, :destroy]
      resources :categories, only: [:index, :show, :create, :update, :destroy]
      resources :reports, only: [:index, :show, :create, :update, :destroy] do
        member do
          put 'upvote' => 'reports#upvote'
          put 'downvote' => 'reports#downvote'
        end
      end
      resources :users, only: [:create]
      # Sessions
      resources :sessions, only: [:create]
      get 'sessions/destroy'
      # get 'sessions/two_factor'

      # Authy
      post 'authy/callback' => 'authy#callback'
      get 'authy/status' => 'authy#one_touch_status'
      post 'authy/send_token'
      post 'authy/verify'
    end
  end

  # These resources serve our website, not the API:
  root 'reports#index'
  resources :answers
  resources :reports
  resources :categories
  resources :blocked_phone_numbers, except: [:new, :edit]
end
