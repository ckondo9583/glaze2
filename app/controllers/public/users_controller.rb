class Public::UsersController < ApplicationController
   before_action :authenticate_user!
   
  def show
     @calculations = current_user.calculations
  end

  def edit
  end
end
