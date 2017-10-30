class UsersController < ApplicationController

  def new
    render :new
  end


  def create
    @user = User.new(user_params)

    if @user.save
      logged_in_user!(@user)
      redirect_to new_session_url
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
