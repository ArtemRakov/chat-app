# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root to: 'home#index'

    resource :session, only: %i[new create destroy]
    resources :users, only: %i[new create]

    resources :teams, only: %i[index show] do
      scope module: :teams do
        resources :channels, only: %i[index show new create] do
          scope module: :channels do
            resources :members, only: [:create]
          end
        end

        resources :members, only: [:create]
      end
    end

    resources :channels, only: [] do
      scope module: :channels do
        resources :members, only: [:create]
      end
    end

    namespace :account do
      resources :teams, only: %i[index new create]
    end
  end

  scope module: :api, defaults: { format: :json } do
    resources :channels, only: [:show] do
      scope module: :channels do
        resources :messages, only: %i[create update destroy]
      end
    end
  end
end
