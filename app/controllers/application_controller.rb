class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

<<<<<<< HEAD
  def current_user
   @current_user ||= Owner.find(session[:owner_id]) if session[:owner_id]
  end

  helper_method :current_user

  def authorize
   redirect_to '/login' unless current_user
  end


end
=======
    def current_renter
     @current_renter ||= Renter.find(session[:renter_id]) if session[:renter_id]
    end
      helper_method :current_renter

    def authorize
      redirect_to '/login' unless current_renter
    end
  end
>>>>>>> d54badc6fc5cdd3155898235b4b0f599d8c8b28a
