class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def show
    id = params[:id]
    @room = Room.find_by_id(id)
    @renter = Renter.find_by_id(current_renter.id)


      #   if @room['renter_ids'] = !nil
      #     id_array = @room['renter_ids'].split("|")
      #   else
      #     id_array = []
      #   end

      #     rentersarray = id_array.push(current_renter.id)
      #     if rentersarray.length > 1
      #       @rentersstring = rentersarray.join("|")
      #     else
      #       @rentersstring = rentersarray.to_s
      #     end

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
    @room = Room.find_by_id(params[:id])

    user_id = session[:renter_id]
    user = Renter.find_by_id(user_id)
    room_id = params['room']['room_id']
    room_string = "#{user['room_ids']}|#{room_id}"
    user.update(room_ids: room_string)


    room_likes = @room.renter_ids
    room_likes += "|#{user_id}"
    @room.update(renter_ids: room_likes)


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

