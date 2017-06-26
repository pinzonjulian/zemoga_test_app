require 'api_constraints'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'

  namespace :zemoga_portfolio_api, defaults: { format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get 'user_info/:id', to: 'users#user_info'
      patch 'modify_user_info/:id', to: 'users#modify_user_info'
    end
  end

  devise_for :users, path: 'users', controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_for :admin, path: 'admins', controllers: {sessions: 'admins/sessions', registrations: 'admins/registrations'}

  devise_scope :user do
    authenticated :user do
      root to: 'users#profile', as: :authenticated_user_root
    end
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_user_root
    end
  end

  devise_scope :admin do
    authenticated :admin do
      root to: redirect('/rails_admin'), as: :authenticated_admin_root
    end
    unauthenticated :admin do
      root to: 'devise/sessions#new', as: :unauthenticated_admin_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: '#home'

  resources :users
end
