class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #attr_accessor :user_logged_in

  private
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      end
    end

    def current_admin_user
      if current_user && @current_user.admin
        @current_admin_user = @current_user
      end
    end

    def authenticate_admin_user!
      if current_admin_user
        @current_admin_user
      else
        redirect_to login_path
        puts ">>>>>>>>>>>>> It's not a admin user <<<<<<<<<<<<<<<<"
      end
    end

    def authenticate_user!
      if !(current_user)
        redirect_to login_path
      end
      #redirect_to login_path unless current_user
    end

    helper_method :current_user, :current_admin_user
end
