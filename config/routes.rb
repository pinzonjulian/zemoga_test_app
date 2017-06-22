Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'users#show', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: '#home'

  resources :users
end
