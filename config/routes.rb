Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  get 'home/registration'
  post 'home/complete_registration'

  resources :todos, only: [:index]

  namespace :api do
    resources :todos, only: [:index, :create] do
      post :toggle, on: :member
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
