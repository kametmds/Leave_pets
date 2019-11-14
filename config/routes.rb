Rails.application.routes.draw do
  resources :pets
  root 'pets#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
