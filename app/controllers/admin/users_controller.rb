class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    # アクティブユーザーだけ表示
    @users = User.where(is_deleted: false)
  
    @calculation = Calculation.first
  end

  def show
    @user = User.find(params[:id])
    @calculations = @user.calculations
    @calculation = Calculation.first
  end

  def edit
    @user = User.find(params[:id])
    @calculation = Calculation.first
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
    params.require(:user).permit(:name,:email ,:introduction,:is_deleted)
  end

  def current_user?
    current_user == @user
  end

  def calculation_params
  params.require(:calculation).permit(:release_status,:fukushimafeldspar,:lithiumcarbonate,:magnesite,:whitelimestone,:strontiumcarbonate,:bariumcarbonate,:zincoxide,:kaolin,:fukushimasilica, :title, :subtitle,:additive1,:additive2,:additive3,:additive4,:additive5,:memo,:tag_id,:tag_ids,:temperature,:image,:additive1_amount,:additive2_amount,:additive3_amount,:additive4_amount,:additive5_amount,:burning_date,:memo,favorites_attributes: [:id, :user_id, :_destroy])
  end


end
