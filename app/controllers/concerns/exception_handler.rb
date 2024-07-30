module ExceptionHandler

  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do
      exception_response(:not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do
      exception_response(:unprocessable_entity)
    end

    rescue_from ActionController::ParameterMissing do
      exception_response(:bad_request)
    end

    rescue_from Errno::ENOENT do
      exception_response(:unprocessable_entity)
    end

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def exception_response(status)
    json_response({ error: I18n.t('errors.something_went_wrong') }, status)
  end

  def user_not_authorized
    json_response({ error: I18n.t('errors.access_denied') }, :forbidden)
  end

end
