class Public::UsersController < ApplicationController
   before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    if current_user == @user || current_user?
      @calculations = @user.calculations
    else
      @calculations = @user.calculations.where(release_status: 1)
    end
  end


  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user)
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
