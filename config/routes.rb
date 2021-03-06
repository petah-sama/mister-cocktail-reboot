Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: %i[index show new create] do
    resources :doses, only: :create
    resources :reviews, only: :create
  end

  resources :doses, only: :destroy
  resources :reviews, only: :destroy
end
