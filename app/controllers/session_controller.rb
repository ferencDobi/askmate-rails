class SessionController < ApplicationController
  def create
    @user = User.find_by_username(params[:login][:username])
    if @user&.authenticate(params[:login][:password])
      session[:username] = @user.username
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    session[:username] = nil
    redirect_back(fallback_location: root_path)
  end
end
