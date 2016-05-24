class RoomsController < ApplicationController

  def index
    if filter = params[:filter]
      # Explore named scopes @rooms = Room.by_borough(filter =
      @rooms = Room.where('borough IN (?)', filter)
      render json: @rooms
    else
      @rooms = Room.all
    end
  end

  def show
    id = params[:id]
    @room = Room.find_by_id(id)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
    redirect_to @room
  end

  def edit
    id = params[:id]
    @room = Room.find_by_id(params[:id])

  end

  def update
    id = params[:id]
    @room = Room.find_by_id(id)
    @room.update_attributes(room_params)

    redirect_to "/rooms/#{id}"
    # redirect_to(:back)
  end

  def destroy
    # id = params[:id]
    @room = Room.find_by(id: params[:id])
    @room.destroy

    # redirect_to '/rooms'
  end

  def user_type
  end

  private
  def room_params
    params.require(:room).permit(
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
                    :available,
                    :thumbnail_url
                    )
  end
end


