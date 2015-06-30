class SessionsController < ApplicationController
  before_action :require_signed_in!, only: [:destroy]
  before_action :require_signed_out!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      sign_in(@user)
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { render json: { message: 'logged in' } }
      end
    else
      @user = User.new(email: params[:user][:email])
      flash.now[:errors] ||= []
      flash.now[:errors] << 'Your email or password was incorrect.'
      render :new
    end
  end

  def destroy
    sign_out

    render json: { message: 'logged out' }
  end
end
