Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subjects, only: [:index]
    end
  end
end
