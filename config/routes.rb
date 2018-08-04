Rails.application.routes.draw do
  devise_for :users
  resources :pins do
    member do
      put "Lile", to: "pins#upvote"
    end
  end

  root "pins#index"
end
