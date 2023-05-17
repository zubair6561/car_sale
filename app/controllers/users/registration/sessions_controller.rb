# frozen_string_literal: true

class Users::Registrations::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # def create
  #   user = User.find_by_email_or_phone(params[:user][:email])

  #   if user&.valid_password?(params[:user][:password])
  #     sign_in(user) # Assuming you are using Devise for authentication
  #     redirect_to user_path(user), notice: "Logged in successfully!"
  #   else
  #     flash.now[:alert] = "Invalid credentials"
  #     render :new
  #   end
  # end
  # def create
  #   user = User.find_by_email_or_phone(params[:identifier])

  #   if user&.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to user_path(user), notice: 'Logged in successfully!'
  #   else
  #     flash.now[:alert] = 'Invalid credentials'
  #     render :new
  #   end
  # end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
