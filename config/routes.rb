Rails.application.routes.draw do
  get 'documents/index'
  get 'documents/new'
  get 'documents/create'
  get 'documents/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  resources :home, only: [:index]

  # mount FatFreeCrm::Engine, at: "/crm"

  resources :accounts, only: [:index]
  resources :call_centers, only: [:index]
  resources :reports, only: [:index]
  resources :configurations, only: [:index, :update]

  resources :uploads do
    post 'upload_lead'
    post 'upload_contact'
    post 'upload_opportunity'
    post 'upload_campaign'
    post 'upload_account'
  end
end