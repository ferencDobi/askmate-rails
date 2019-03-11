# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'signup' => 'users#new'
  post 'signup' => 'users#new'
  resources :users

  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'

  resources :questions

  get '/about' => 'home#about'

  get '/questions' => 'home#temp'

  post '/questions' => 'home#temp'

  get '/questions/:id' => 'home#temp'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
