Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  # devise_for :admins
  # devise_for :users

  devise_for :users, path: 'users', controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_for :admin, path: 'admins', controllers: {sessions: 'admins/sessions', registrations: 'admins/registrations'}

  devise_scope :user do
    authenticated :user do
      root to: 'users#show', as: :authenticated_user_root
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
