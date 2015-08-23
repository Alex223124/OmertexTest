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

  def show
    @payment = Payment.find(params[:id])
  end

  def create
    @loan = Loan.find(current_user.id)
    @payment = @loan.payments.new(secure_params)
    if @payment.save
      flash[:success] = "Your Payment was committed succesfully"
      redirect_to @payment
    else
      render 'new'
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(secure_params)
      redirect_to payments_path, :notice => "Payment details updated."
    else
      redirect_to payments_path, :alert => "Unable to update Payment's Details."
    end
  end

  def delete
    @payment = Payment.find(params[:id])
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy
    redirect_to payments_path, :notice => "Payment deleted."
  end

  
  private

  def secure_params
    params.require(:payment).permit(:payment_amount, :payment_name)
  end

end
