 Rails.application.routes.draw do
  get 'comments/create'

     root to: "welcome#index"

   devise_for :users, controllers:
   {registrations: 'users/registrations', sessions:'users/sessions'}
   resources :accounts do
     resources :teams do
     end
    end
   resources :comments
    post "addmember", to: "teams#addmember"
    #get "user_check", to: "invitations#user_check"
    resources :invitations
    get "check", to: "invitations#user_check"

    mount ActionCable.server => '/cable'
  end
