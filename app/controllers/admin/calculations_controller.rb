class Admin::CalculationsController < ApplicationController
  before_action :authenticate_admin!


  def index
   @calculations = Calculation.all
   @calculations = Calculation.joins(:user).where(users: { is_deleted: false })
  end

 def show
  @calculation = Calculation.find(params[:id])
  puts @calculation.inspect
  @tags = @calculation.tags
  @active_comments = @calculation.comments.joins(:user).where(users: { is_deleted: false })
 end

  def update
    @calculation = Calculation.find(params[:id])
    if @calculation.update(calculation_params)
      redirect_to admin_calculation_path(@calculation)
    else
      render :edit
    end
  end

   private

  def calculation_params
  params.require(:calculation).permit(:release_status,:fukushimafeldspar,:lithiumcarbonate,:magnesite,:whitelimestone,:strontiumcarbonate,:bariumcarbonate,:zincoxide,:kaolin,:fukushimasilica, :title, :subtitle,:additive1,:additive2,:additive3,:additive4,:additive5,:memo,:tag_id,:temperature,:image,:additive1_amount,:additive2_amount,:additive3_amount,:additive4_amount,:additive5_amount,:burning_date,:memo)
  end

end
