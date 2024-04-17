class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!


 def index
    @tags = Tag.all
    @tag = Tag.new
    @calculation = Calculation.first
 end


def create
  @tag = Tag.new(tag_params)
  if @tag.save
    # タグ作成が成功した場合の処理を追加
    redirect_to admin_tags_path, notice: 'タグが作成されました'
  else
    @tags = Tag.all
    # タグ作成が失敗した場合の処理を追加
    flash.now[:alert] = 'タグの作成に失敗しました'
    render :index
  end
end


  def edit
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
  end

  private

   def tag_params
    params.require(:tag).permit(:tag_name)
   end

end
