class Public::CalculationsController < ApplicationController
 before_action :authenticate_user!


  def new
   @amount = session[:amount]
   @fukushimafeldspar = session[:fukushimafeldspar]
   @lithiumcarbonate = session[:lithiumcarbonate]
   @magnesite = session[:magnesite]
   @whitelimestone =session[:whitelimestone]
   @strontiumcarbonate = session[:strontiumcarbonate]
   @bariumcarbonate = session[:bariumcarbonate]
   @zincoxide =  session[:zincoxide]
   @kaolin =  session[:kaolin]
   @fukushimasilica =  session[:fukushimasilica]
   @calculation = Calculation.new

  end

  def create
  @calculation = Calculation.new(calculation_params)
  @calculation.user_id = current_user.id

  if @calculation.save
    redirect_to @calculation
  else
   @amount = session[:amount]
   @fukushimafeldspar = session[:fukushimafeldspar]
   @lithiumcarbonate = session[:lithiumcarbonate]
   @magnesite = session[:magnesite]
   @whitelimestone =session[:whitelimestone]
   @strontiumcarbonate = session[:strontiumcarbonate]
   @bariumcarbonate = session[:bariumcarbonate]
   @zincoxide =  session[:zincoxide]
   @kaolin =  session[:kaolin]
   @fukushimasilica =  session[:fukushimasilica]
  
    render :new
  end
  end


  def index
    @calculations = Calculation.all
  end

  def show
   @calculation = Calculation.find(params[:id])
   puts @calculation.inspect
   @user = current_user
  end

  def edit
  end

  private

  def calculation_params
  params.require(:calculation).permit(:release_status,:fukushimafeldspar,:lithiumcarbonate,:magnesite,:whitelimestone,:strontiumcarbonate,:bariumcarbonate,:zincoxide,:kaolin,:fukushimasilica, :title, :subtitle,:additive1,:additive2,:additive3,:additive4,:additive5,:memo,:tag_id,:temperature,:image,:additive1_amount,:additive2_amount,:additive3_amount,:additive4_amount,:additive5_amount)
  end

end


