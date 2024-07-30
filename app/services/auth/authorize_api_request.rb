require 'json_web_token'

module Auth

  class AuthorizeApiRequest

    include BaseService

    attr_reader :headers

    def initialize(request)
      @headers = request.headers
    end

    def admin_user
      return unless payload

      admin = AdminUser.find_by(email: payload['email'])

      admin.presence
    end

    private

    def payload
      JsonWebToken.decode(headers['Authorization'].split.last).first
    rescue StandardError
      nil
    end

  end

end
