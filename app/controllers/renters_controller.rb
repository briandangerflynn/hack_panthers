class RentersController < ApplicationController
  def index
    @renters = Renter.all
  end

  def show
    @renter = Renter.find(params[:id])
    @room_ids = @renter['room_ids'].split("|")

  end

  def new
    @renter = Renter.new
  end

  def create
     renter = Renter.new(renter_params)
     if renter.save
       session[:renter_id] = renter.id
       redirect_to '/renters'
     else
       redirect_to '/signup'
     end
  end
  # def create
  #   @renter = Renter.create(renter_params)
  #   redirect_to @renter
  # end

  def edit
    @renter = Renter.find(params[:id])
  end

  def update
    @renter = Renter.find(params[:id])
    @renter.update_attributes(renter_params)
    redirect_to "/renters/#{@renter['id']}"
  end

  def destroy
    @renter = Renter.find(params[:id])
    session.clear
    @renter.destroy
    redirect_to "/renters"
  end

  private
  def renter_params
    params.require(:renter).permit(:room_ids, :name, :email, :password, :description, :has_pet)
  end


end
