class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @calculation = Calculation.first
    @users = User.all
  end

  def show
    @calculation = Calculation.find(params[:id])
    @user = User.find(params[:id])
    @calculations = @user.calculations
  end

  def edit
    @calculation = Calculation.first
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

  def calculation_params
  params.require(:calculation).permit(:release_status,:fukushimafeldspar,:lithiumcarbonate,:magnesite,:whitelimestone,:strontiumcarbonate,:bariumcarbonate,:zincoxide,:kaolin,:fukushimasilica, :title, :subtitle,:additive1,:additive2,:additive3,:additive4,:additive5,:memo,:tag_id,:temperature,:image,:additive1_amount,:additive2_amount,:additive3_amount,:additive4_amount,:additive5_amount,:burning_date,:memo)
  end

end
