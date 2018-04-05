 Rails.application.routes.draw do
  get 'team_members/index'

  get 'team_members/create'

     root to: "welcome#index"

   devise_for :users, controllers:
   {registrations: 'users/registrations', sessions:'users/sessions'}
   resources :accounts do
     resources :teams

    post '/member', to: 'teams#addmembers'
    end
   resources :invitations
  end
