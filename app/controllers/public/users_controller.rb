class Public::UsersController < ApplicationController
   before_action :authenticate_user!
    before_action :ensure_guest_user, only: [:edit]#before_actionでeditアクション実行前に処理を行う
  

  def show
    @calculation = Calculation.first
    @user = User.find(params[:id])
    if current_user == @user || current_user?
      @calculations = @user.calculations
    else
      @calculations = @user.calculations.where(release_status: 1)
    end
    #いいね一覧表示用
  
    @favorites = current_user.favorites.includes(:calculation)
  end


  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user)
     else
       render :edit
     end
  end

   private

  def user_params
    params.require(:user).permit(:name,:email ,:introduction)
  end
  
  def current_user?
    current_user == @user
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  
  
end
