# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages/home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'test/hostname', to: 'pages/test#hostname'
end
