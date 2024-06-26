class Public::CalculationsController < ApplicationController
 before_action :authenticate_user!
 before_action :validate_amount, only: [:create]

  def new
   @calculation = Calculation.new
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
   validate_amount
  
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
   @images = @calculation.images

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
   @images = @calculation.images
   render :edit unless @calculation.user == current_user
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
  params.require(:calculation).permit(:release_status, :fukushimafeldspar, :lithiumcarbonate, :magnesite, :whitelimestone, :strontiumcarbonate, :bariumcarbonate, :zincoxide, :kaolin, :fukushimasilica, :title, :subtitle, :additive1, :additive2, :additive3, :additive4, :additive5, :memo, :tag_id, :temperature, :additive1_amount, :additive2_amount, :additive3_amount, :additive4_amount, :additive5_amount, :burning_date, :memo, favorites_attributes: [:id, :user_id, :_destroy], tag_ids: [], images: [])
 end

def validate_amount
  amounts = [@fukushimafeldspar, @lithiumcarbonate, @magnesite, @whitelimestone, @strontiumcarbonate, @bariumcarbonate, @zincoxide, @kaolin, @fukushimasilica]
  if amounts.any? { |value| value.present? && (value.to_f < -10) }
    flash[:alert] = "調合量に10g以上の値が含まれています。計算結果をやりなおしてください。"
    redirect_to user_top_path and return
  end
end

end