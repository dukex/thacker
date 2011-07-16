Thacker::Application.routes.draw do
  resources :projects

  resources :events

  devise_for :admins
  devise_for :users

  resources :posts

  root :to => 'application#livestream'
end
