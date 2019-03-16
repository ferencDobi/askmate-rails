class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = if request.get?
              User.new
            else
              User.new(user_params)
            end
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      errors = user.errors.full_messages
      if errors.find { |message| /confirmation doesn't match/ =~ message }
        flash[:signup_error] = 'Passwords must match.'
      elsif errors.find { |message| /has already been taken/ =~ message }
        flash[:signup_error] = 'Username or email already in use.'
      end
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email,
                                 :password, :password_confirmation, :birthday)
  end
end
