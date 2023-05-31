Rails.application.routes.draw do
  
  devise_for :users

  resources :posts do
    member do
      patch :close, to: 'posts#close' # Map close action to update action
    end
  end
  
  resources :cars do
    resources :steps, only: [:show, :update], controller: 'cars/steps'
  end
  
  root to: 'cars#index'

end


