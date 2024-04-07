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
    render :new
  end
  end


  def index
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
  params.require(:calculation).permit(:release_status,:fukushimafeldspar,:lithiumcarbonate,:magnesite,:whitelimestone,:strontiumcarbonate,:bariumcarbonate,:zincoxide,:kaolin,:fukushimasilica)
  end

end


