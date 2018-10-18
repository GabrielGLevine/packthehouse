# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :theaters
  resources :shows
  get 'home/index'
  get 'home/about'

  root to: 'shows#index'
end
