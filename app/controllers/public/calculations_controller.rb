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
  
  def index
  end

  def show
  end

  def edit
  end
end
