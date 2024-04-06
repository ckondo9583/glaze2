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
   
  
  end

  def create
  @calculation = Calculation.new
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
  end

  def edit
  end

  private

  
end


