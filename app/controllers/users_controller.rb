class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized
  before_action :set_user


  
  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    @current_user_loans = User.find_by(user_id: @user.id)
    authorize @user
  end

  def current_user_loans
    @user = User.find(params[:id])
    @loan = Loan.find_by(loan_id: @user.id).to_a
    authorize User
  end

  def new
    @user = User.new
    authorize User
  end

  def create
    @user = User.new(secure_params)
    percente_rate
    authorize User
    if @user.save
      flash[:success] = "Your account has been created succesfully"
      session[:user_id] = @user.id
      redirect_to loans_path 
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def delete
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:email, :password, :client_income, :role)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
