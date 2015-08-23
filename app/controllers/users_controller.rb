class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  
  def index
    @users = User.all
    authorize User
  end

  def new
    @user = User.new
  end

  def show
    @loan = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account has been created succesfully"
      session[:user_id] = @user.id
      redirect_to loans_path 
    else
      render 'new'
    end
  end

  def show
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

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :client_income)
  end

  def secure_params
    params.require(:user).permit(:role)
  end

end
