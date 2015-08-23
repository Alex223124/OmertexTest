class PaymentsController < ApplicationController
  #before_filter :authenticate_user!
  #after_action :verify_authorized

  
  def index
    @payments = Payment.all
    #authorize User
  end

  def new
    @payment = Payment.new
  end


end
