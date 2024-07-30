module Api

  module V1

    class AuthenticationsController < ApiController

      skip_before_action :authenticate_current_user

      def create
        command = Auth::AuthenticateAdmin.call(params[:authentication].to_unsafe_hash)

        if command.success?
          json_response(jwt_token: command.result)
        else
          json_response(serialized_errors(command.errors), :unauthorized)
        end
      end

    end

  end

end
