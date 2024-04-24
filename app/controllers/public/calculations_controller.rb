class Public::CalculationsController < ApplicationController
 before_action :authenticate_user!
 before_action :validate_amount, only: [:new]

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
     @calculations = Calculation.joins(:user).where(release_status: 1, users: { is_deleted: false })
  end

  def show
   @calculation = Calculation.find(params[:id])
   puts @calculation.inspect
   @user = current_user
   @comment = Comment.new
   # @calculation_comments = @calculation.comments
   @active_comments = @calculation.comments.joins(:user).where(users: { is_deleted: false })
   # アクティブなコメントのみを取得(show側も@active_commentsに変更)
   # @tag = Tag.find(@calculation.tag_id)
   # @calculation_tags = @calculation.tags
   @tags = @calculation.tags

  end

  def search
  keyword = params[:keyword]
  @calculations = Calculation.joins(:user)
                             .joins(:tags)
                             .where('release_status = 1 AND users.is_deleted = ? AND (temperature = ? OR tag_name = ? OR memo LIKE ? OR title LIKE ? OR subtitle LIKE ? OR burning_date = ? OR additive1 LIKE ? OR additive2 LIKE ? OR additive3 LIKE ? OR additive4 LIKE ? OR additive5 LIKE ? )',
                                 false, keyword, keyword, "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", keyword, "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
  render :index
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

def validate_amount
  if params[:amount].to_f < 0
    flash[:alert] = "調合量がマイナスです。正しい値を入力してください。"
    redirect_to user_top_path
  elsif [@fukushimafeldspar, @lithiumcarbonate, @magnesite, @whitelimestone, @strontiumcarbonate, @bariumcarbonate, @zincoxide, @kaolin, @fukushimasilica]
        .any? { |value| value.present? && (value.to_f < 0) }
    flash[:alert] = "マイナスの値が含まれています。正しい値を入力してください。"
    redirect_to user_top_path
  end
end
end