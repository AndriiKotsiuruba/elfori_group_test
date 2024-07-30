class ApiController < ActionController::API

  include Response
  include ExceptionHandler
  include Serializable

  before_action :authenticate_current_user

  def current_user
    @current_user ||= set_current_user
  end

  private

  def set_current_user
    @set_current_user ||= ::Auth::AuthorizeApiRequest.new(request).admin_user
  end

  def authenticate_current_user
    return if set_current_user

    json_response(serialized_errors(I18n.t('errors.invalid_request')), :unauthorized)
  end

end
