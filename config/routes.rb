Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  resources :home, only: [:index]

  mount FatFreeCrm::Engine, at: "/crm"

  resources :accounts, only: [:index]
  resources :call_centers, only: [:index]
  resources :reports, only: [:index]
  resources :configurations, only: [:index, :update]
  resources :documents, only: [:index, :new, :create, :destroy]

  resources :uploads do
    post 'upload_lead'
    post 'upload_contact'
    post 'upload_opportunity'
    post 'upload_campaign'
    post 'upload_account'
  end

  namespace :api do
    namespace :v1 do
      resources :qbo_account_statuses, only: [] do
        collection do
          get :account_status
          get :payment_history
          get :current_statement_service
        end
      end
    end
  end


end