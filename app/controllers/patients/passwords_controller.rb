# frozen_string_literal: true

class Patients::PasswordsController < Devise::PasswordsController
  # skip_before_action :authenticate_patient_from_token!, only: [:create, :update]
  
  # def create
    # patient = Patient.find_by(email: create_params[:email])
    # patient&.send_reset_password_instructions
    # redirect_to root_path
  # end
  
  # def update
    # @patient = Patient.reset_password_by_token(update_params)
  # end
  
  # private
  # def create_params
    # params.require(:patient).permit(:email)
  # end
  
  # def update_params
    # params.require(:patient).permit(:password, :password_confirmation, :reset_password_token)
  # end
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
