Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :pets
  resources :spaces
  root 'spaces#index'
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :rooms, only: [:show, :create, :index] do
    member do
      post  :joins
    end
  end
  resources :messages, only: [:create, :destroy]
end
