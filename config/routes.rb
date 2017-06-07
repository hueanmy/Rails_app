Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vn/, defaults: {locale: :en} do
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    root "static_pages#home"

    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users do
        member do
            get :following, :followers
        end
    end

    resources :users, except: :new
    resources :account_activations, only: :edit
    resources :password_resets, except: []
    resources :microposts, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
  end
end
