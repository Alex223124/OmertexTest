class LoansController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized
  before_action :set_user 
  
  def index
    if current_user.admin?
      @loans = Loan.all
      authorize Loan
    else
      @loans = @user.loans  
      authorize Loan
    end
  end

  def current_loan_payments
    @loan = Loan.find(params[:id])
    @payment = Payment.find_by(loan_id: @loan.id).to_a
    authorize Loan
  end

  def new
    @loan = Loan.new
    authorize Loan
  end

  def show
    @loan = Loan.find(params[:id])
    @current_loan_payments = Payment.find_by(loan_id: @loan.id)
    authorize @loan
  end

  def create
    @loan = @user.loans.new(secure_params)
    set_percente_rate
    set_loan_name
    authorize @loan
    if @loan.save
      flash[:success] = "Your Loan has been created succesfully"
      redirect_to @loan
    else
      redirect_to loans_path, :alert => "Unable to create loan."
    end
  end

  def edit
    @loan = Loan.find(params[:id])
    authorize Loan
  end

  def update
    @loan = Loan.find(params[:id])
    authorize @loan
    if @loan.update_attributes(secure_params)
      redirect_to loans_path, :notice => "Loan updated."
    else
      redirect_to loans_path, :alert => "Unable to update loan."
    end
  end

  def delete
    @loan = Loan.find(params[:id])
    authorize @loan
  end

  def destroy
    loan = Loan.find(params[:id])
    authorize loan
    loan.destroy
    redirect_to loans_path, :notice => "Loan deleted."
  end

  private

  def secure_params
    params.require(:loan).permit(:loan_amount, :period, :status, :description)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  # Концепция %-й ставки за год
    # Если доход больше 100 и меньше либо равно 1500$ то процентная ставка 30% годовых
    # Если доход больше либо равен 1501 и меньше либо равен 5000 то процентная ставка 20% годовых
    # Есди доход больше либо равен 5001 и меньше либо равен 100 000 000 то процентная ставка 10% годовых    
  def set_percente_rate
    if @user.client_income.nil?
      # Перенаправление есть вконце метода креейт
    else
      x = @user.client_income 
      if x > 100 && x <= 1500
         @loan.percente_rate = 30
      elsif x >= 1501 && x <= 5000
         @loan.percente_rate = 20
      elsif x >= 5001 && x <= 100000000000000
         @loan.percente_rate = 10
      else
        # Перенаправление есть в конце метода create
      end
    end
  end

  # Кастомный метод который придумывает название для кредита
  def set_loan_name
    @loan.loan_name = "Loan Request registred: " + Time.now.to_s
  end

end
