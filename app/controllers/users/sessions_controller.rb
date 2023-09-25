# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # DELETE /resource/sign_out
  def destroy
    super
  end
end
