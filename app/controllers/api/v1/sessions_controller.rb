module Api
  module V1
    class SessionsController < Devise::SessionsController
      # before_action :require_no_authentication, :only => [:create ]
      # before_action :reset_authentication_token, :only => [:create]
      # include Devise::Controllers::InternalHelpers

      before_action :ensure_params_exist

      respond_to :json

      def create
        resource = User.find_for_database_authentication(:email=>params[:user][:email])
        return invalid_login_attempt unless resource

        if resource.valid_password?(params[:user][:password])
          sign_in("user", resource)
          render :json=> {:success=>true, :auth_token=>resource.authentication_token, :username=>resource.username, :email=>resource.email}
          return
        end
        invalid_login_attempt
      end

      def destroy
        puts "in signout"
        @current_user = nil
        render :json=>{ message: "User logged out successfully."}, status: :ok
      end

      protected
      def ensure_params_exist
        return unless params[:user].blank?
        render :json=>{:success=>false, :message=>"missing user parameter"}, :status=>422
      end

      def invalid_login_attempt
        warden.custom_failure!
        render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
      end
      def reset_authentication_token
        self.authentication_token = self.class.authentication_token
      end
    end
  end
end