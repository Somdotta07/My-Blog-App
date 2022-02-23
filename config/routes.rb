Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[new create index show] do
      get 'comments/new', to: 'comments#new'
      post 'comments/new', to: 'comments#create'
      post 'likes/new', to: 'likes#create'
    end
  end
end
