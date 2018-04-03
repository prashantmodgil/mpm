 Rails.application.routes.draw do
     root to: "welcome#index"

   devise_for :users, controllers:
   {registrations: 'users/registrations', sessions:'users/sessions'}
   resources :accounts do
     resources :teams
    end
   resources :invitations
  end
