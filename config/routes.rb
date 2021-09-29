Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]
  get 'comments/create'
  resources :blogs do
    resources :comments

  end
end
