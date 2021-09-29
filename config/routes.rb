Rails.application.routes.draw do
  resources :users
  get 'comments/create'
  resources :blogs do
    resources :comments

  end
end
