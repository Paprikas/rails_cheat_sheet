Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tweets, except: [:new]
  root to: "tweets#index"
end
