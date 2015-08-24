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
    @loan = @user.loans.new(secure_params)
    percente_rate_for_year
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

  def secure_params
    params.require(:loan).permit(:loan_name, :loan_amount, :period, :status)
  end

    # Концепция %-й ставки за год
    # Если доход больше 100 и меньше либо равно 1500$ то процентная ставка 30% годовых
    # Если доход больше либо равен 1501 и меньше либо равен 5000 то процентная ставка 20% годовых
    # Есди доход больше либо равен 5001 и меньше либо равен 100 000 000 то процентная ставка 10% годовых    
  def percente_rate_for_year
    x = @user.client_income 
    if x > 100 && x <= 1500
      @loan.percente_rate = 0.3
    elsif x >= 1501 && x <= 5000
      @loan.percente_rate = 0.2
    elsif x >= 5001 && x <= 100000000
      @loan.percente_rate = 0.1
    else
      redirect_to loans_path, :alert => "Unable to create loan."
    end
  end

end