class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized
  before_action :set_user

  
  def index
    @user = User.find(current_user.id)
    if current_user.admin?
      @payments = Payment.all
      authorize Payment
    else
      @payments = @user.payments
      authorize Payment
    end
  end

  def new
    @payment = Payment.new
    authorize @payment
    
  end

  def show
    @user = User.find(current_user.id)
    @payment = Payment.find(params[:id])
    @loan = Loan.find(params[:loan_id])
    authorize @payment
  end

  def create
    @user = User.find(current_user.id)
    @loan = Loan.find(params[:loan_id])
    @payment = @loan.payments.build(secure_params)
    payment_name
    set_user_id
    authorize @payment
    if @payment.save
      flash[:success] = "Your Payment was committed succesfully"
      redirect_to loan_path(@loan)
    else
      render 'new'
    end
  end

  def edit
    @payment = Payment.find(params[:id])
    authorize Payment
  end

  def update
    @payment = Payment.find(params[:id])
    authorize @payment
    if @payment.update_attributes(secure_params)
      redirect_to payments_path, :notice => "Payment details updated."
    else
      redirect_to payments_path, :alert => "Unable to update Payment's Details."
    end
  end

  def delete
    @payment = Payment.find(params[:id])
    authorize @payment
  end

  def destroy
    payment = Payment.find(params[:id])
    authorize payment
    payment.destroy
    redirect_to payments_path, :notice => "Payment deleted."
  end

  
  private

  def secure_params
    params.require(:payment).permit(:payment_amount, :payment_name, :description)
  end

  def payment_name
    @payment.payment_name = "Payment registred at: " + Time.now.to_s
  end

  def set_user_id
    @payment.user_id = current_user.id
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
