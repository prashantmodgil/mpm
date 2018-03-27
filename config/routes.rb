 Rails.application.routes.draw do
     root to: "welcome#index"

   devise_for :users, controllers:
   {registrations: 'users/registrations', sessions:'users/sessions'}
   resources :accounts
   resources :invitations
  end
