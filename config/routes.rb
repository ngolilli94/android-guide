Rails.application.routes.draw do
  devise_for :developers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :topics
  resources :tutorials
  resources :subjects, except: :index
end
