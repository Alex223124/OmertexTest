class LoansController < ApplicationController
  #before_filter :authenticate_user!
  #after_action :verify_authorized

  
  def index
    @loans = Loan.all
  end

  def new
    @loan = Loan.new
  end

  def show
    @loan = Loan.find(params[:id])
  end

  def create
    @user = User.find(current_user.id)
    @loan = @user.loans.new(loan_params)
    if @loan.save
      flash[:success] = "Your Loan has been created succesfully"
      redirect_to @loan
    else
      render 'new'
    end
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def update
    @loan = Loan.find(params[:id])
    if @loan.update_attributes(secure_params)
      redirect_to loans_path, :notice => "Loan updated."
    else
      redirect_to loans_path, :alert => "Unable to update loan."
    end
  end

  def delete
    @loan = Loan.find(params[:id])
  end

  def destroy
    loan = Loan.find(params[:id])
    loan.destroy
    redirect_to loans_path, :notice => "Loan deleted."
  end

  

  private

  def loan_params
    params.require(:loan).permit(:loan_name, :loan_amount, :period)
  end

  def secure_params
    params.require(:loan).permit(:status)
  end

end
