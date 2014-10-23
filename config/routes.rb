Rails.application.routes.draw do

  devise_for :users
  root to: "static_pages#home"
  resources :items do
    collection { post :import }
  end

end
