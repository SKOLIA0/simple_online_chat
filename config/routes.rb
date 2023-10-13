Rails.application.routes.draw do
  # Основные маршруты для веб-интерфейса
  resources :chats do
    resources :messages, only: [:create]
  end

  # API маршруты
  namespace :api do
    namespace :v1 do
      resources :chats, only: [:index]
      resources :messages, only: [:create]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "chats#index" 
end
