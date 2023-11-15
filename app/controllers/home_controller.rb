class HomeController < ApplicationController
  before_action :authenticate_user!
 # http_basic_authenticate_with name: "clemente", password: "admin2022user", only: :create
  

  def index 
    
    @link= Link.new
    @firstlink = current_user.links.last
    # Rooms controller 
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all
    @room = Room.new
    @message = Message.new
  
    @single_room = Room.find_by_id(1)   
    @messages = @single_room.messages

  end

 def create   
    
    @link = Link.new(link_params.merge(user_id: current_user.id))   
    if @link.save   
      redirect_to root_path   
    else   
      redirect_to root_path   
    
    end 

 #   @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])
  end   



private

  def link_params   
    params.require(:link).permit(:url, :user_id)   
  end   

  def msg_params 
  params.permit(:content)
  end 
end
