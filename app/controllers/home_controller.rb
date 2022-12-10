class HomeController < ApplicationController

  before_action :authenticate_user!
  
  def index 
    @link= Link.new
    @firstlink = Link.last
  end




 def create   
    @link = Link.new(link_params)   
    if @link.save   
      flash[:notice] = 'Product added!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit product!'   
            redirect_to root_path   
    end   
  end   
   

private
  def link_params   
    params.require(:link).permit(:url)   
  end   

end