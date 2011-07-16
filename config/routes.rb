Thacker::Application.routes.draw do
  resources :events

  devise_for :admins
  devise_for :users

  resources :posts

  root :to => 'application#livestream'
end
