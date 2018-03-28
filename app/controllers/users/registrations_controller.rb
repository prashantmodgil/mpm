# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  #def new
    #@user = User.new
    #below logic when user is redirected from his email link
    #  if params[:invitation_id]
        #for automatically assign the email to user
    #    @user.email = params[:email]
        #saving invitation_id
    #    @invitation_id = params[:invitation_id]
    #  else
    #    @invitation_id = ''
    #  end
    #super
  #end

  # POST /resource
   #def create
    # @name = params[:user][:name]
     #super
      #if current_user
      #creats account after creation of user
      #Account.create(name: params[:account_name], user_id: current_user.id)
      #    if params[:invitation_id] != ''
          #run update query in invitation table i.e. it will put value in mem_id colum with current_user
      #    Invitation.find(params[:invitation_id]).update(mem_id: current_user.id)
      #     else
      #   end
     #end
   #end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  # devise_parameter_sanitizer.permit(:sign_up, keys: [:account_name])
  #   super
  # end

   #protected

  # If you have extra params to permit, append them to the sanitizer.
   #def configure_sign_up_params
   #end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
#   def after_sign_up_path_for(accounts)
#      '/accounts'
#   end

  # The path used after sign up for inactive accounts.
#   def after_inactive_sign_up_path_for(resource)
#     '/accounts'
#   end
end
