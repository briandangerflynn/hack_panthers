class SessionsController < ApplicationController

 def newowner
  render 'newowner'
 end

def newrenter
  render 'newrenter'
 end

 def createowner
  owner = Owner.find_by_email(params[:email])
   # @owner = Owner.find_by_email(params[:session][:email])
   # If the owner exists AND the password entered is correct.
   # if owner && owner.authenticate(params[:password])
  if owner && owner.authenticate(params[:password])
     # Save the owner id inside the browser cookie. This is how we keep the owner
     # logged in when they navigate around our website.
     session[:owner_id] = owner.id
     redirect_to "/owners/#{owner.id}"
     # session[:owner_id] = owner.id
     # redirect_to '/owners'
  else
    redirect_to '/ownerlogin'
    # flash[:error] "Invalid Username/password"
  end
end


  def createrenter
    renter = Renter.find_by_email(params[:email])
   # If the user exists AND the password entered is correct.
   if renter && renter.authenticate(params[:password])
     # Save the user id inside the browser cookie. This is how we keep the user
     # logged in when they navigate around our website.
     session[:renter_id] = renter.id
     redirect_to '/rooms'
    else
      redirect_to '/renterlogin'
    end
  end

   def destroyrenter
      session.clear
      session[:owner_id] = ""
      session[:renter_id] = ""
     redirect_to '/'
   end

   def destroyowner
      session.clear
      session[:owner_id] = ""
      session[:renter_id] = ""
     redirect_to '/'
   end

end



