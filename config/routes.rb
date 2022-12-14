Rails.application.routes.draw do

  namespace :admin do
    resources :frames, only: %i[index create update destroy]
    resources :lenses, only: %i[index create update destroy]
  end

  resources :frames, only: %i[index]
  resources :lenses, only: %i[index]
  resources :glasses, only: [] do
    collection do
      post :add_to_cart
    end
  end
end
