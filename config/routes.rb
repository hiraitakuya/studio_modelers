Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  
end
