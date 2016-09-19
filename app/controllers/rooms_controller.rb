class RoomsController < ApplicationController

  def index
    if filter = params[:filter]
      # Explore named scopes @rooms = Room.by_borough(filter =
      @rooms = Room.where('borough IN (?)', filter).order('rooms.updated_at DESC').all
      render json: @rooms
    else
      @rooms = Room.order('rooms.updated_at DESC').all
    end
  end

  def show
    id = params[:id]
    @room = Room.find_by_id(id)
      if @room['renter_ids'] == nil
        user_id = session[:renter_id]
        user = Renter.find_by_id(user_id)
        renter_ids = "#{user_id}"

      else
        renter_ids = @room['renter_ids'].split("|").drop(1)
      end

    @renter_ids = renter_ids
  end

  def new
    @room = Room.new
    if current_owner == nil
      redirect_to '/owners/signup'
    end
  end

  def create
    @room = Room.create(room_params)
    redirect_to @room
  end

  def edit
    @room = Room.find_by(id: params[:id])

  end

  def update


    @room = Room.find_by(id: params[:id])
    @room.update_attributes(room_params)

    user_id = session[:renter_id]
    user = Renter.find_by_id(user_id)
    room_id = params['room']['room_id']
    room_string = "#{user['room_ids']}|#{room_id}".split("|")
    room_string = room_string.join("|")
    user.update(room_ids: room_string)


    room_likes = @room.renter_ids
    if room_likes == nil
      room_likes == "#{user_id}"
    else
      room_likes += "|#{user_id}"
    end
    @room.update(renter_ids: room_likes)


    redirect_to "/rooms/#{@room.id}"
    # redirect_to(:back)
  end

  def destroy
    @room = Room.find_by(id: params[:id])
    @room.destroy

    # redirect_to '/rooms'
  end

  def user_type
    if current_owner = ""
      reset_session
    end
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


