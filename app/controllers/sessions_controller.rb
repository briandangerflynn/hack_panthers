class SessionsController < ApplicationController

 def new
  render 'new'
 end

 def create
  owner = Owner.find_by_email(params[:email])
  unless nil
   # @owner = Owner.find_by_email(params[:session][:email])
   # If the owner exists AND the password entered is correct.
   # if owner && owner.authenticate(params[:password])
  if owner && owner.authenticate(params[:password])
     # Save the owner id inside the browser cookie. This is how we keep the owner
     # logged in when they navigate around our website.
     session[:owner_id] = owner.id
     redirect_to '/owners'
     # session[:owner_id] = owner.id
     # redirect_to '/owners'
   else
    renter = Renter.find_by_email(params[:email])
     # If the user exists AND the password entered is correct.
     if renter && renter.authenticate(params[:password])
       # Save the user id inside the browser cookie. This is how we keep the user
       # logged in when they navigate around our website.
       session[:renter_id] = renter.id
       redirect_to '/renters'
      else
        redirect_to '/login'
      end
    end
  else
    redirect_to '/login'
    flash[:error] "Invalid Username/password"
  end


 def destroy
    session[:owner_id] = ""
    session[:renter_id] = ""
   redirect_to '/login'
 end

end

