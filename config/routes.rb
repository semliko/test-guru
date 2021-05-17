Rails.application.routes.draw do
  root 'tests#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true
    get '/tests/:category/:title', to: 'test#search'
  end
end
