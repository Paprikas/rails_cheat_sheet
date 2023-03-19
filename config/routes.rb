Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tweets, except: [:new]
  resources :absurd_generator, only: [:index]
  post "/absurd_generator", to: "absurd_generator#index"

  root to: "application#home_page"
end
