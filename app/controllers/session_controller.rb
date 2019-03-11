class SessionController < ApplicationController
  def create
    @user = User.find_by_username(params[:login][:username])
    if @user&.authenticate(params[:login][:password])
      session[:user_id] = @user.id
    else
      flash[:error] = 'Invalid username or password.'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    session[:user_id] = nil
    redirect_back(fallback_location: root_path)
  end
end
