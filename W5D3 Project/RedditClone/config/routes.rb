Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :show]
  resource :session
  resources :subs, except: [:destroy]
  resources :posts, except: [:index, :destroy] do
    resources :comments
  end
end
