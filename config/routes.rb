Rails.application.routes.draw do
  root "products#index"

  scope "/(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    resources :products

    namespace :admin do
      resources :groups
      resources :users, only: [:index, :show]

      namespace :legacy do
        resources :offers, only: [:index, :show]
        resources :offer_items, only: [:index, :show]
      end
    end

    get "terms_of_service", to: "static_pages#terms_of_service"
    get "privacy_policy", to: "static_pages#privacy_policy"
  end
end
