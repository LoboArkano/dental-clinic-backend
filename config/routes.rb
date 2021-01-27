# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sessions, only: %i[create]
  root to: 'static#home'
end
