class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def show
    id = params[:id]
    @room = Post.find_by(id)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)

    redirect_to '/rooms'
  end

  def edit
    id = params[:id]
    @room = Room.find_by(id)
  end

  def update
    id = params[:id]
    @room = Room.find_by(id)
    @room.update_attributes(room_params)

    redirect_to '/rooms'
  end

  def destroy
    id = params[:id]
    @room = Room.find_by(id)
    @room.destroy

    redirect_to '/rooms'
  end

  private
  def room_params
    params.require(:room).allow(
                    :address,
                    :user_id,
                    :available,
                    :price,
                    :video_url,
                    :pets_allowed,
                    :renter_ids,
                    :description,
                    :title,
                    :neighborhood,
                    :borough,
                    :available
                    )
  end
end

