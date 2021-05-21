# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  resources :tweets, except: [:new]
  root to: "tweets#index"
end
