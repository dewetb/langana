Rails.application.routes.draw do
  resources :workers do
    resources :work_references
    member do
      get :confirm
      post :verify_confirmation
    end
  end

  resources :users do
    member do
      get :new_password
      patch :reset_password
      get :confirm
      post :verify_confirmation
      get :resend_confirmation
    end
  end

  root 'workers#index'
  get 'signin' => 'sessions#new'
  get 'workers_signin' => 'workers_sessions#new'
  resource :workers_session
  resource :session
  get 'forgot_password' => 'users#forgot_password'
  post 'send_reset_code' => 'users#send_reset_code'

  get 'signup_worker' => 'workers#new'
  get 'signup_employer' => 'users#new'
  get 'choose_role' => 'visitors#choose_role'

  get 'workers/filter/:scope' => 'workers#index', as: :filtered_workers
end
