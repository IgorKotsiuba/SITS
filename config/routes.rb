Rails.application.routes.draw do
  scope module: :customer do
    root to: 'tickets#new'
    resources :tickets, only: %i[create show], param: :reference_uuid
  end

  namespace :manager do
    root to: 'sessions#new'
    resource :sessions, only: %i[create destroy]
    resources :tickets, only: %i[index show update], param: :reference_uuid
  end
end
