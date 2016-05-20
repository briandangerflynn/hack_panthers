
class SessionsController < ApplicationController

 def new
 end

 def create
   renter = Renter.find_by_email(params[:email])
   # If the user exists AND the password entered is correct.
   if renter && renter.authenticate(params[:password])
     # Save the user id inside the browser cookie. This is how we keep the user
     # logged in when they navigate around our website.
     session[:renter_id] = renter.id
     redirect_to '/renters'
   else
   # If user's login doesn't work, send them back to the login form.
     redirect_to '/login'
   end
 end

 def destroy
   @session = session[:renter_id] = nil
   redirect_to '/login'
 end

end
