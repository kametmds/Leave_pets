Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :pets
  resources :spaces
  root 'spaces#index'
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :rooms, only: [:show, :create, :index, :destroy] do
    resources :messages, only: [:create, :destroy]
    member do
      post  :joins, :messages
    end
  end
  resources :joins, only: :destroy
  resources :messages, only: [:create, :destroy]
end
