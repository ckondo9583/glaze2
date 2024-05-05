class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!


 def index
    @tags = Tag.all
    @tag = Tag.new
   
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
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
     redirect_to admin_tags_path, notice: 'タグが更新されました'
    else
     flash.now[:alert] = 'タグの更新に失敗しました'
     render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_path, notice: 'タグが削除されました'
  end

  private

   def tag_params
    params.require(:tag).permit(:tag_name)
   end

end
