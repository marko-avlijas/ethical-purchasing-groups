Rails.application.routes.draw do
  root "static_pages#terms_of_service"
  get "terms_of_service", to: "static_pages#terms_of_service"
  get "privacy_policy", to: "static_pages#privacy_policy"
end
