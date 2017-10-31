class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.cheer_count = 0
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :cheer_count)
  end
end
