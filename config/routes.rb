Rails.application.routes.draw do
  devise_for :users

  resources :pins do
    collection do
      get 'search'
    end
  end

  resources :pins do
    member do
      put "Lile", to: "pins#upvote"
    end
  end

  get ':username' => 'users#show', as: 'user'

  root "pins#index"

  resources :tags, only: [:show]
end
