Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users

  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  unauthenticated do
    root to: "home#index", as: :unauthenticated_root
  end

  resources :products
  resource :cart, only: [:show] do
    post "checkout", on: :member
  end

  resources :cart_items, only: [:create, :destroy]
  resources :orders, only: [:show]
end



# Login ke baad dashboard#index dikhayega.]

# Sellers go to Dashboard (dashboard#index)                       #   ✔ Buyers go to Products Page (products#index)

#     seller dashboard where they can:

# ✅ View their listed products
# ✅ Add new products
# ✅ Edit/Delete their products
# ✅ View orders (if adding order functionality later)