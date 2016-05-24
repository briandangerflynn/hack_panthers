class RentersController < ApplicationController
  def index
    @renters = Renter.all
  end

  def show
    @renter = Renter.find_by(id: params[:id])
  end

  def new
    @renter = Renter.new
  end

  def create
     renter = Renter.new(renter_params)
     if renter.save
       session[:renter_id] = renter.id
       redirect_to '/rooms'
     else
       redirect_to '/renters/signup'
     end
  end

  def edit
    @renter = Renter.find_by(id: params[:id])
  end

  def update
    @renter = Renter.find(params[:id])
    @renter.update_attributes(renter_params)
    redirect_to @renter
  end

  def destroy
    @renter = Renter.find(params[:id])
    session.clear
    @renter.destroy
    redirect_to '/renters/signup'
  end

  private
  def renter_params
    params.require(:renter).permit(:name, :email, :password, :description, :has_pet, :video_url)
  end


end
