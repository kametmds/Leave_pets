Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :pets
  resources :spaces do
    resources :reviews
    collection { get "search" }
    collection { get "intro" }
  end

  resources :rooms, only: [:show, :create, :index, :destroy]
  resources :joins, only: :destroy
  resources :messages, only: [:create, :destroy]
  resources :reservations
  root 'spaces#index'
end
