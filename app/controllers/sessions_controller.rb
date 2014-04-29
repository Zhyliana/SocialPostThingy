class SessionsController < ApplicationController
  def new
  end

  def create
    @current_user = User.find_by_credentials(user_params)
    if @current_user
      login!(@current_user)
      redirect_to newsfeed_url(@current_user)
    else
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
