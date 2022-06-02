Rails.application.routes.draw do
  root "profiles#index"

  resources :profiles do
    resources :comments
  end
end
