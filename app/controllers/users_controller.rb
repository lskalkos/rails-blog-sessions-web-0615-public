class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  skip_before_action :authorize, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save!

    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to welcome_path, :notice => "Hello, #{@user.name}!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end

  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
