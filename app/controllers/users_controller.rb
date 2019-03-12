class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    begin
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = 'Username or email already in use.'
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name,
                                 :email, :password, :birthday)
  end
end
