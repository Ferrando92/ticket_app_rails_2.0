Rails.application.routes.draw do
  devise_for :users
  resources :user
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "home#index"
  get 'admin/users' => 'user#list'
end
