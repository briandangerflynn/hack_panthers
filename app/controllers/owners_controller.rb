class OwnersController < ApplicationController

  # require 'bcrypt'

  # enable :sessions

  # def current_owner
  #   @current_owner ||= conn.exec("SELECT * FROM owners WHERE id=#{session[:owner_id]}").first
  # end

  # def logged_in?
  #   current_owner
  # end

  # get "/" do
  #   erb :signup
  # end

  # get "/login" do
  #   erb :login
  # end

  # post "/signup" do
  #   @email = params[:email]
  #   @password = BCrypt::Password::create(params[:password])
  #   conn.exec_params(
  #       "INSERT INTO owners (email, password) VALUES ($1, $2)",
  #       [@email, @password]
  #     )

  #   end

  # post "/login" do
  #   @email = params[:email]
  #   @password = params[:password]

  #   @owner = conn.exec_params(
  #       "SELECT * FROM owners WHERE email=$1 LIMIT 1",
  #       [@email]
  #     ).first

  #     if @owner && BCrypt::Password::new(@owner["password"]) == params[:password]
  #       "You have successfully logged in"
  #       session[:owner_id] = @owner["id"]
  #     else
  #       "Incorrect email or password!"
  #     end
  #   end

  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find_by(id: params[:id])
  end

  def new
    @owner = Owner.new
  end

  # def create
  #   @owner = Owner.create(owner_params)
  #   redirect_to @owner
  # end


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

  # def conn
  #   PG.connect(dbname: "hack_panthers")
  # end



end
