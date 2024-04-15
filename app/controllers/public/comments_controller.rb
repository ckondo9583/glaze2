class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @calculation = Calculation.find(params[:calculation_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.calculation_id = @calculation.id
    @comment.save
    redirect_to calculation_path(@calculation)
  end

  def destroy
    @calculation = Calculation.find(params[:calculation_id])
    @calculation_comments = @calculation.comments
    Comment.find_by(id: params[:id], calculation_id: params[:calculation_id]).destroy
    redirect_to calculation_path(@calculation)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end