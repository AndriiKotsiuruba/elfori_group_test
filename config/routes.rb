# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  ActiveAdmin.routes(self)

  if Rails.env.development?
    mount Rswag::Api::Engine => '/api-docs'
    mount Rswag::Ui::Engine  => '/api-docs'
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  namespace :api do
    namespace :v1 do
      resources :collections, except: %i[edit new]

      resource :authentication, only: :create
    end
  end

  resources :collections, only: %i[index show] do
    scope module: :collections do
      resources :invoices, only: :create
    end
  end

  root to: 'collections#index'
end
