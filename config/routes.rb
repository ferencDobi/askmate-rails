# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'signup' => 'users#new'
  post 'signup' => 'users#new'
  resources :users

  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'

  resources :questions do
    post 'vote/up' => 'question_vote#up'
    post 'vote/down' => 'question_vote#down'

    resources :answers

    post 'answers/:id/vote/up' => 'answer_vote#up', as: 'answer_vote_up'
    post 'answers/:id/vote/down' => 'answer_vote#down', as: 'answer_vote_down'
  end

  get '/about' => 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
