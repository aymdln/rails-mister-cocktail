Rails.application.routes.draw do
  resources :cocktails, only: [:new, :create, :show, :index, :destroy, :edit] do
    resources :doses, only: [ :new, :create, :edit]
  end
  resources :doses, only: :destroy
end
