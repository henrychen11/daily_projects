class SessionsController < ApplicationController


  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:name],
      params[:user][:password]
    )

    if user
      login(user)
      redirect_to session_url(user)
    else
      flash[:errors] = ["Invalid login"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
