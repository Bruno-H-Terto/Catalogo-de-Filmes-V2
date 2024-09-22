Rails.application.routes.draw do
  root 'home#index'
  resources :genders, only:[:new, :create, :index, :show, :edit, :update]
  resources :directors, only:[:new, :create, :index, :show, :edit, :update]
  resources :movies, only:[:new, :create, :index, :show, :edit, :update]
end
