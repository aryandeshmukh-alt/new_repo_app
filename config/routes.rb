Rails.application.routes.draw do
  devise_for :users
  resources :blogs do
    member do
      patch :publish
    end

    collection do
      get :published
      get :drafts
    end

    resources :comments, only: [:create, :destroy]
  end

  root "blogs#index"
end
