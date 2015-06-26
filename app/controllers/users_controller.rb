class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.find_who_to_follow_by_user(current_user)

    render json: @users.as_json(only: [:id, :username])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      Follow.self_follow(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if current_user.update_attributes(user_params)
      flash.now[:notice] = [ 'Successfully Save!' ]
    else
      flash.now[:errors] = current_user.error.full_messages
    end

    render :edit
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
