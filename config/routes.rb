Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users

  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :records, only: [ :new, :show, :create, :destroy]
  end

  authenticated :user do
  root :to => 'categories#index', as: :authenticated_root
  end
  root 'splash#index'
end
