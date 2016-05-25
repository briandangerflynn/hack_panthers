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

      if @room['renter_ids'] == nil
        user_id = session[:renter_id]
        user = Renter.find_by_id(user_id)
        renter_ids = "#{user_id}"

      else
        renter_ids = @room['renter_ids'].split("|")
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
    id = params[:id]
    @room = Room.find_by_id(params[:id])

  end

  def update
    id = params[:id]
    @room = Room.find_by_id(params[:id])

    user_id = session[:renter_id]
    user = Renter.find_by_id(user_id)
    room_id = params['room']['room_id']
    room_string = "#{user['room_ids']}|#{room_id}".split("|")
    room_string = room_string.join("|")
    user.update(room_ids: room_string)


    room_likes = @room.renter_ids
    if room_likes == nil
      room_likes == ""
    else
      room_likes += "|#{user_id}"
    end
    @room.update(renter_ids: room_likes)


    redirect_to "/rooms/#{id}"
    # redirect_to(:back)
  end

  def destroy
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


