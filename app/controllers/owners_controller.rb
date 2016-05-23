class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find_by(id: params[:id])
    @rooms = Room.where(user_id: "#{@owner.id}")
  end

  def new
    @owner = Owner.new
  end

  def create
     @owner = Owner.new(owner_params)
     if @owner.save
       session[:owner_id] = @owner.id
       redirect_to '/owners'
     else
       redirect_to '/signup'
     end
   end

  def edit
    @owner = Owner.find_by(id: params[:id])
  end

  def update
    @owner = Owner.find_by(id: params[:id])
    @owner.update_attributes(owner_params)
    redirect_to @owner
  end

  def destroy
    @owner = Owner.find_by(id: params[:id])
    session.clear
    @owner.destroy
    redirect_to owners_path
  end

  private

  def owner_params
    params.require(:owner).permit(:name, :email, :password, :room_ids, :video_url, :description, :has_pets)
  end



end
