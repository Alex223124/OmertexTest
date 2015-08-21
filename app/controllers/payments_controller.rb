class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  
  def index
    @payments = Payment.all
    authorize User
  end

  def show
    @payment = Payment.find(params[:id])
    authorize @user
  end

  def update
    @payment = Payment.find(params[:id])
    authorize @user
    if @payment.update_attributes(secure_params)
      redirect_to payments_path, :notice => "Payment updated."
    else
      redirect_to payments_path, :alert => "Unable to update payment."
    end
  end

  def destroy
    payment = Payment.find(params[:id])
    authorize user
    payment.destroy
    redirect_to payments_path, :notice => "payment deleted."
  end

  private

  def secure_params
    params.require(:payment).permit(:payment_amount)
  end

end
