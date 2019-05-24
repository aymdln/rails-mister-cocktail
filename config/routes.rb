Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [:new, :create, :show, :destroy, :edit] do
    resources :doses, only: [ :new, :create, :edit]
  end
  resources :doses, only: :destroy
end
