class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_owner
    if session[:owner_id] != ""
     @current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
    end
  end

  helper_method :current_owner

  def authorize_owner
   redirect_to '/login' unless current_owner
  end

  def current_renter
    # binding.pry
    if session[:renter_id] != ""
     @current_renter ||= Renter.find(session[:renter_id]) if session[:renter_id]
   end
  end

  helper_method :current_renter

  def authorize_renter
    redirect_to '/login' unless current_renter
  end
end

