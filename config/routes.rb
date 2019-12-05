Rails.application.routes.draw do


  # get    "cocktails",          to: "cocktails#index"

  # get    "cocktails/new",      to: "cocktails#new", as: :new_cocktail
  # post   "cocktails",          to: "cocktails#create"
  # # NB: The `show` route needs to be *after* `new` route.
  # get    "cocktails/:id",      to: "cocktails#show", as: :cocktail

  # # get    "cocktails/:id/edit", to: "cocktails#edit"
  # # patch  "cocktails/:id",      to: "cocktails#update"

  # delete "cocktails/:id",      to: "cocktails#destroy"

  #  # resources :cocktails

  # get    "doses",          to: "doses#index"

  # get    "doses/new",      to: "doses#new", as: :new_dose
  # post   "doses",          to: "doses#create"

  # # NB: The `show` route needs to be *after* `new` route.
  # get    "doses/:id",      to: "doses#show", as: :dose

  # # get    "doses/:id/edit", to: "doses#edit"
  # # patch  "doses/:id",      to: "doses#update"

  # delete "doses/:id",      to: "doses#destroy"

  root to: 'pages#home'
  resources :doses, only: [:destroy]
  resources :cocktails do
    resources :reviews, only: [:new, :create]
    resources :doses, only: [:index,:new, :create] do
      resources :ingredients, only: [:index, :new, :create, :destroy]
      end
    end
  end
