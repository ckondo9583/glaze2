class Public::FavoritesController < ApplicationController
   before_action :authenticate_user!

def index
  @calculation = Calculation.find(params[:calculation_id])
  @favorites = current_user.favorites.includes(:calculation)
  # @favorites = current_user.favorites.includes(:calculation).where("calculations.user_id = ? AND users.is_deleted = ?", @calculation.user_id, false)
  render :index
end

def create
  @calculation_favorite = Favorite.new(user_id: current_user.id, calculation_id: params[:calculation_id])
  @calculation_favorite.save
  redirect_to calculation_path(params[:calculation_id])
end

def destroy
  @calculation_favorite = Favorite.find_by(user_id: current_user.id, calculation_id:params[:calculation_id])
  @calculation_favorite.destroy
  redirect_to calculation_path(params[:calculation_id])
end


end
