Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tasks do
    resources :comments
    member do
      put "like", to: "tasks#upvote"
    end
  end
end
