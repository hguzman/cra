Rails.application.routes.draw do


  resources :guides, only: [:index]

  resources :shipments do
    resources :guides, module: :shipment do
      collection do
        get :report
        post :import
      end
    end
  end

  devise_for :users

  authenticated :user do
    root 'shipments#index', as: :authenticated_root
  end

  root 'welcome#index'

end
