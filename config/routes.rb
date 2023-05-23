Rails.application.routes.draw do
  
  namespace :pet do
    get 'steps/show'
    get 'steps/update'
  end
  devise_for :users
 
  # resources :posts, only: [:index]
  # resources :ads do
  #   # Wizard steps
  #   get 'steps', to: 'ads#steps', as: 'ad_steps'
  #   get 'step1', to: 'ads#step1', as: 'ad_step1'
  #   get 'step2', to: 'ads#step2', as: 'ad_step2'
  #   get 'step3', to: 'ads#step3', as: 'ad_step3'
  # end
  resources :after_signup
  # resources :cars
  # resources :ads do
  #   member do
  #     get :step, action: :show 
  #     put :step, action: :update
  #   end
  # end
  resources :cars, only: [:new, :create, :show, :index] do
    resources :steps, only: [:show, :update], controller: 'cars/steps'
    
  end
  
  # resources :cars, only: [:new, :create, :show, :index] do
  #   resources :ads, only: [:show, :update]
  # end
  
  root to: 'cars#index'

  
end


