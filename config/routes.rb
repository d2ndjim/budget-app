Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users

  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :records, only: [ :new, :show, :create, :destroy]
  end

  root 'splash#index'

  authenticated :user do
    root :to => 'categories#index', as: :authenticated_root
  end
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
end
