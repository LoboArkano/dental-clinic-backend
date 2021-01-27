# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sessions, only: %i[create]
  resources :registrations, only: %i[create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  root to: 'static#home'
end
