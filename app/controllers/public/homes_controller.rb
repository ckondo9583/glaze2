class Public::HomesController < ApplicationController
  before_action :validate_amount, only: [:calculate]
  
  
  def top
    @calculation = Calculation.first
  end

  def calculate
    @kano = params[:kano].to_f
    @li2o = params[:li2o].to_f
    @mgo = params[:mgo].to_f
    @cao = params[:cao].to_f
    @sro = params[:sro].to_f
    @bao = params[:bao].to_f
    @zno = params[:zno].to_f
    @al2o3 = params[:al2o3].to_f
    @sio2 = params[:sio2].to_f
    session[:amount] = @amount = params[:amount].to_f

    @kano_result = @kano / 0.1574 * 100
    @li2o_result = @li2o / 1.3414 * 100
    @mgo_result = @mgo / 1.1359 * 100
    @cao_result = @cao / 0.9897 * 100
    @sro_result = @sro / 0.6624 * 100
    @bao_result = @bao / 0.5002 * 100
    @zno_result = @zno / 1.2263 * 100
    @al2o3_result = ((@al2o3 - (0.17 * @kano / 0.1574)) / 0.3821) * 100
    @sio2_result =  ((@sio2 - (1.128 * @kano / 0.1574)) - (0.7584 * (@al2o3 - (0.17 * @kano / 0.1574)) / 0.3821)) / 1.6525 * 100

    @total = @kano_result + @li2o_result + @mgo_result + @cao_result + @sro_result + @bao_result + @zno_result + @al2o3_result + @sio2_result

    session[:fukushimafeldspar] = @fukushimafeldspar = @kano_result/@total * @amount
    session[:lithiumcarbonate] = @lithiumcarbonate = @li2o_result/@total * @amount
    session[:magnesite] = @magnesite = @mgo_result/@total * @amount
    session[:whitelimestone] = @whitelimestone = @cao_result/@total * @amount
    session[:strontiumcarbonate] = @strontiumcarbonate = @sro_result / @total * @amount
    session[:bariumcarbonate] = @bariumcarbonate = @bao_result / @total * @amount
    session[:zincoxide] = @zincoxide = @zno_result / @total * @amount
    session[:kaolin] = @kaolin = @al2o3_result / @total * @amount
    session[:fukushimasilica] = @fukushimasilica = @sio2_result / @total * @amount
    
    render 'top'
    
    
  end

  def about
  end
  
  private

  def validate_amount
    unless params[:amount].present? && params[:amount].to_f > 0
      # エラーメッセージを設定
      flash[:alert] = "正しい数値を入力してください"
      redirect_to user_top_path
    end
  end
  
end
