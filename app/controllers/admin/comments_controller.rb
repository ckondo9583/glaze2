class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
  # @comments = Comment.all
  @comments = Comment.includes(:user).where(users: { is_deleted: false })
  @users = @comments.map { |comment| User.find(comment.user_id) }
  end

  def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to admin_comments_path(@comment.calculation), notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_id)
  end

  def calculation_params
  params.require(:calculation).permit(:release_status,:fukushimafeldspar,:lithiumcarbonate,:magnesite,:whitelimestone,:strontiumcarbonate,:bariumcarbonate,:zincoxide,:kaolin,:fukushimasilica, :title, :subtitle,:additive1,:additive2,:additive3,:additive4,:additive5,:memo,:tag_id,:temperature,:image,:additive1_amount,:additive2_amount,:additive3_amount,:additive4_amount,:additive5_amount,:burning_date,:memo)
  end


end
