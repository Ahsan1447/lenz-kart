Rails.application.routes.draw do
  get 'glasses/add_to_cart'
  namespace :admin do
    resources :frames, only: %i[index create update destroy]
    resources :lenses, only: %i[index create update destroy]
  end

  resources :frames, only: %i[index]
  resources :lenses, only: %i[index]
end
