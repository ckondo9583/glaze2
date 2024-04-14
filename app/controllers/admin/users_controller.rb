class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
  end

  def show
    @user = User.find(params[:id])
    @calculations = @user.calculations
  end

  def edit
    @user = User.find(params[:id])
  end
  
   def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
        redirect_to admin_user_path(@user)
     else
       render :edit
     end
   end
  
  private

  def user_params
    params.require(:user).permit(:name,:email ,:introduction)
  end
  
  def current_user?
    current_user == @user
  end
  
end
