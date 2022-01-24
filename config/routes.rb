Rails.application.routes.draw do
  devise_for :users
  root "static_pages#terms_of_service"

  namespace :admin do
    resources :groups
  end

  get "terms_of_service", to: "static_pages#terms_of_service"
  get "privacy_policy", to: "static_pages#privacy_policy"
end
