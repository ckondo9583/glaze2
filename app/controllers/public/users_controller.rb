class Public::UsersController < ApplicationController
   before_action :authenticate_user!
    before_action :ensure_guest_user, only: [:edit]#before_actionでeditアクション実行前に処理を行う


  def show
    if params[:id] == 'unsubscribe'
    redirect_to user_path(current_user) , notice: 'ユーザーが見つかりませんでした。'
    return
    end
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



 def withdraw
     @user = current_user
   if current_user.update(is_deleted: true)
     reset_session
     flash[:notice] = "退会処理を実行いたしました"
     redirect_to user_top_path
   else
     flash[:alert] = "退会処理に失敗しました"
     redirect_to user_path(current_user)
   end
 end



   private

  def user_params
    params.require(:user).permit(:name,:email ,:introduction,:is_deleted)
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
