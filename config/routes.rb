Rails.application.routes.draw do
  get 'home/index'

  resources :todos, only: [] do
    post :toggle, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
