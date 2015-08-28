class StaticPagesController < ApplicationController
  
  def index
  	if current_user
  		redirect_to loans_path
  	end
  end

  def take_loans
  end

  def make_payments
  end

  def be_superhero
  end

  
end
