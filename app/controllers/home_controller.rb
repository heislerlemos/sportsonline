class HomeController < ApplicationController
  before_action :authenticate_user!
  http_basic_authenticate_with name: "clemente", password: "admin2022user", only: :create
  

  def index 
    
    @link= Link.new
    @firstlink = current_user.links.last
    # Rooms controller 
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all
    
  end

 def create   
    
    @link = Link.new(link_params.merge(user_id: current_user.id))   
    if @link.save   
      redirect_to root_path   
    else   
      redirect_to root_path   
    
    end   
  end   



private

  def link_params   
    params.require(:link).permit(:url, :user_id)   
  end   

end
