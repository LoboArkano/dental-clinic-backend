# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sessions, only: %i[create]
  resources :registrations, only: %i[create]
  resources :treatments, only: %i[index show create]
  resources :doctors, only: %i[index show create]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  root to: 'static#home'
end
