class LoansController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  
  def index
    @loans = Loan.all
    authorize User
  end

  def show
    @loan = Loan.find(params[:id])
    authorize @user
  end

  def update
    @loan = Loan.find(params[:id])
    authorize @user
    if @loan.update_attributes(secure_params)
      redirect_to loans_path, :notice => "Loan updated."
    else
      redirect_to loans_path, :alert => "Unable to update loan."
    end
  end

  def destroy
    loan = Loan.find(params[:id])
    authorize user
    loan.destroy
    redirect_to loans_path, :notice => "Loan deleted."
  end

  private

  def secure_params
    params.require(:loan).permit(:status)
  end

end
