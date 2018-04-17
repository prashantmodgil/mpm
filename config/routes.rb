 Rails.application.routes.draw do
     root to: "welcome#index"

   devise_for :users, controllers:
   {registrations: 'users/registrations', sessions:'users/sessions'}
   resources :accounts do
     resources :teams
    #post "check", to:"teams#check"
    end
    post "addmember", to: "teams#addmember"
    get "user_check", to: "invitations#user_check"
    resources :invitations
    mount ActionCable.server => '/cable'
  end
