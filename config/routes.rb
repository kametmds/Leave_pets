Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :pets
  resources :spaces
  root 'spaces#index'
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :talks, only: [:show, :create] do
    member do
      post  :memberships, :messages
    end
  end
  resources :memberships, only: :destroy
  resources :messages, only: :destroy
end
