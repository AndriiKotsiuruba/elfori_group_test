# frozen_string_literal: true

module Users

  class RegistrationsController < Devise::RegistrationsController

    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name surname])
    end

  end

end
