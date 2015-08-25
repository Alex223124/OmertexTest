class StaticPagesController < ApplicationController
  
  def index
  	if current_user
  		redirect_to loans_path
  	end
  end
  
end
