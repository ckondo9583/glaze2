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
  @calculation.tag_ids = params[:calculation][:tag_ids]
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
   @calculations = Calculation.where(release_status: 1)
  end

  def show
   @calculation = Calculation.find(params[:id])
   puts @calculation.inspect
   @user = current_user
   @comment = Comment.new
   @calculation_comments = @calculation.comments
   @calculation = Calculation.find(params[:id])
   # @tag = Tag.find(@calculation.tag_id)
   # @calculation_tags = @calculation.tags
    @tags = @calculation.tags
  end

  def edit
   @calculation = Calculation.find(params[:id])
    redirect_to calculations_path unless @calculation.user == current_user
  end

  def update
    @calculation = Calculation.find(params[:id])
    if @calculation.update(calculation_params)
      redirect_to calculation_path(@calculation)
    else
      render :edit
    end
  end


  def destroy
    @calculation = Calculation.find(params[:id])
    @calculation.destroy
    redirect_to calculations_path
  end



  private

  def calculation_params
  params.require(:calculation).permit(:release_status,:fukushimafeldspar,:lithiumcarbonate,:magnesite,:whitelimestone,:strontiumcarbonate,:bariumcarbonate,:zincoxide,:kaolin,:fukushimasilica, :title, :subtitle,:additive1,:additive2,:additive3,:additive4,:additive5,:memo,:tag_id,:tag_ids,:temperature,:image,:additive1_amount,:additive2_amount,:additive3_amount,:additive4_amount,:additive5_amount,:burning_date,:memo,favorites_attributes: [:id, :user_id, :_destroy])
  end

end


