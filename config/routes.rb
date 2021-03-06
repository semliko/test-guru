Rails.application.routes.draw do

  namespace :admin do
    resources :badges
  end

  resources :user_badges, only: [:index]

  resources :contacts, only: [:new, :create, :show, :index] do
    get 'contacts', to: 'contacts#new'
  end
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root 'tests#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index, only: [:show, :index] do
      resources :answers, shallow: true, except: :index, only: [:show, :index]
    end
    get '/tests/:category/:title', to: 'test#search'
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :badges
    get 'gists', to: 'gists#index'
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end

end
