module Api
  module V1

    class ApiController <  ActionController::Base
      private
      def authenticate
        puts "authentiation token " + params[:auth_token]
        @current_user = User.find_by_authentication_token(params[:auth_token])
        puts @current_user.username
        if !@current_user
          render json: { message: "Invalid User"}, status: :not_found
        end
      end

      def current_user
        @current_user ||= authenticate
      end
      def is_admin
        if !current_user.admin
          render json: { message: "No Access to Create/Update/Delete Movies."}, status: :not_found
        end
      end
    end
  end
end