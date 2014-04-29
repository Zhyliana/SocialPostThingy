SocialThingy::Application.routes.draw do
  resources :users do
    resources :circles, only: [:new, :create, :index]
    resources :posts, only: [:new, :create, :index]
  end

   get "/users/:id/feed", to: "users#feed", as: 'newsfeed'
  resources :circles, only: [:edit, :update, :show, :index, :destroy]
  resources :posts, only: [:edit, :update, :show, :destroy]
  resources :links, only: [:show]
  resource :session

end