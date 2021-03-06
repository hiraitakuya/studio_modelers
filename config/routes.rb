Rails.application.routes.draw do
  root "home#index"
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  get "users/show" => "users#show"

  resources :products
end
