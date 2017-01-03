class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      end
    end

    def admin?
      if current_user
        current_user.admin
      end
    end

    def authenticate_user!
      redirect_to login_path unless current_user
    end

    helper_method :current_user, :admin?
end
