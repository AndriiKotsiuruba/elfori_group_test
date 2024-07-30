require 'json_web_token'

module Auth

  class AuthenticateAdmin

    include BaseService

    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def call
      email      = params[:email]
      password   = params[:password]
      admin = AdminUser.find_by(email: email.downcase)

      if admin.present? && admin.valid_password?(password)
        create_jwt_token(admin)
      else
        errors.add(:_base, I18n.t('errors.something_went_wrong'))
      end
    end

    private

    def create_jwt_token(admin)
      JsonWebToken.encode(admin.token_payload)
    end

  end

end
