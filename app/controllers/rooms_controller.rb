class RoomsController < ApplicationController
  
  
  def create 
  @room = Room.create(name: params["room"]["name"])
  end

  def show 
  @current_user = current_user
  @single_room = Room.find(params[:id])
  @rooms = Room.public_rooms
  @users = User.all_except(@current_user)
  @room = Room.new
 @firstlink = current_user.links.last
  @message = Message.new

  render "home/index"

  end
end
