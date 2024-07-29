# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  ActiveAdmin.routes(self)

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  resources :collections, only: %i[index show] do
    scope module: :collections do
      resources :invoices, only: :create
    end
  end

  root to: 'collections#index'
end
