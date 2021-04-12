# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root to: 'home#index'

    resource :session, only: %i[new create destroy]
    resources :users, only: %i[new create]
    #   resource :registrations, only: [:new, :create]

    resources :teams, only: %i[index show] do
      scope module: :teams do
        resources :channels, only: %i[index show new create]
        resources :members, only: [:create]
      end
    end

    #   resources :channels, only: [] do
    #     scope module: :channels do
    #       resource :join, only: [:create]
    #     end
    #   end

    namespace :account do
      resources :teams, only: %i[index new create]
    end

    # scope module: :api do
    #   resources :channels, only: [] do
    #     scope module: :channels do
    #       resources :messages, only: [:create, :update, :destroy]
    #     end
    #   end
  end
end
